///@description Condenses all changelists, removing entires which are either invalidated by later/earier entries or which cancel each other out.

//Suffice to say, we will activate all changelists to do this. They are normally deactivated unless being written-to/read-from to conserve CPU power.
instance_activate_object(oChangeList);


//And also suffice to say, this will be work done on every single oChangeList instance.
with (oChangeList)
{
	//If, for whatever reason, this oChangeList does not have a changes grid, we just skip to the next.
	if (!ds_exists(changes, ds_type_grid))
	{
		continue;
	}
	
	//Grab the height of the changelist so we know how many times to loop through it.
	var _h = ds_grid_height(changes);
	//Removing all the cleaned up entries can be really expensive and slow. We use this bool to flag if we did any cleaning at all.
	//This lets us skip the removal of cleaned up entries where no cleaning was done.
	var _cleaned = false;
	var _i, _j, _iCom, _iTar, _jCom, _jTar, _k, _kCom, _kTar;
	
	//Here's how this works: starting with the top entry, for every entry we read every entry below it.
	//We're checking if something either makes the entry pointless (such as a coordinate update having another coordinate update after it)...
	//... or if two entries cancel each other out (such as a remove and an add).
	//Such needless entries are flagged with with the cleanUp entry command type.
	for (_i = 0; _i < _h; _i++)
	{
		
		//Pull the command and target for this entry.
		_iCom = ds_grid_get(changes, changeListColumns.command, _i);
		_iTar = ds_grid_get(changes, changeListColumns.target, _i);
		
		
		//Now, we start looking at every entry below this one.
		for (_j = _i + 1; _j < _h; _j++)
		{
			
			//Pull the command and target for this second entry.
			_jCom = ds_grid_get(changes, changeListColumns.command, _j);
			_jTar = ds_grid_get(changes, changeListColumns.target, _j);
			
			//Now we need to do the rest of the work based on what command the first entry was.
			switch (_iCom)
			{
				
				case changeListCommands.removeInstanceByCHID:
					#region removeInstanceByCHID
					
					//The first command was a remove instance? Let's check if this is any of the add instance commands for the same CHID.
					//We also only care if the two entries share the same target.
					if (_jCom == changeListCommands.addInvItemCHIDAndFile && _iTar == _jTar)
					{
						//These two entries cancel each other. Set both to be cleaned up.
						ds_grid_set(changes, changeListColumns.command, _i, changeListCommands.cleanUp);
						ds_grid_set(changes, changeListColumns.command, _j, changeListCommands.cleanUp);
						_cleaned = true;
						
						
						
						//Originally, I thought to purge the upcoming entries for X and Y changes. However, you should actually only do that if the add came first, the remove second.
						//Otherwise, you're dealing with a case where the player basically moved the instance in the same chunk.
						//Instead, we just handle X/Y updates in another case statement, and cleanse further updates to the same CHID.
						//So what to do if this somehow creates lingering X/Y updates? On chunk LOAD, we should note the CHID didn't exist and mark the command as cleanup there.
						
						
						//We no longer care about further conflicts as they might also have their own conflict they need to invalidate. 
						//So we're done looping on _j for now.
						//To break out of _j (and not this switch statement), we just set _j to be above its threshold for looping.
						_j = _h + 1;
					}
					
					else if (_jCom == changeListCommands.addInstanceWithCHID)
					{
					}
					
					
					#endregion removeInstanceByCHID
					break;
				
				//This one shares a lot of the same idealogies with the one above, but in reverse. 
				//So if you feel this is undercommented, I suggest checking up there.
				case changeListCommands.addInvItemCHIDAndFile:
					#region addInvItemCHIDAndFile
					//The first command was to add an item? Let's check if the same CHID was removed again anywhere else down the changelist.
					if (_jCom == changeListCommands.removeInstanceByCHID && _iTar == _jTar)
					{
						//So these two conflict. Let's mark both for cleanup.
						ds_grid_set(changes, changeListColumns.command, _i, changeListCommands.cleanUp);
						ds_grid_set(changes, changeListColumns.command, _j, changeListCommands.cleanUp);
						_cleaned = true;
						
						//Generally, when an inv item instance is added, it's X and Y coordinates are set as the next two entries.
						//Let's check if the next two entries after I match this, and if so, flag them for cleanup as well.
						
						//We use k to branch off of j.
						_k = _i;
						//We'll only be checking the next 2 rows, so we can use the rare and basic repeat loop here.
						repeat (2)
						{
							_k++;
							if (!(_k >= _h))
							{
								//Grab the command and target for this row.
								_kCom = ds_grid_get(changes, changeListColumns.command, _k);
								_kTar = ds_grid_get(changes, changeListColumns.target, _k)
								
								//If the command is specifically the update X or Y command type for a recently added item and the two targets match,
								//then this entry is also flagged for cleanup.
								if ((_kCom == changeListCommands.addInvItemCHIDAndFileUpdateX || _kCom == changeListCommands.addInvItemCHIDAndFileUpdateY) && _kTar == _iTar)
								{
									ds_grid_set(changes, changeListColumns.command, _k, changeListCommands.cleanUp);
								}
							}
						}
						
						//We've done work for a matching entry. We can break this iteration of the inner loop.
						_j = _h + 1;
					}
					#endregion addInvItemCHIDAndFile
					break;
					
				
				//Looks like this entry was already marked for cleanup by prior work in this method. We can just ignore it.
				case changeListCommands.cleanUp:
					break;
					
				
				//Not sure how we got here, myself. Way to go, dingus. Did you hand-edit a JSON file or something?
				default:
					break;
			}
			
		}
	}
	
	//Alright, here's where things get tricky. Actually, this is probably less confusing than the loop above, but whatever.
	//We already iterated through the changelist once and marked which entries no longer need to exist.
	//NOW we're going to make a new changelist grid, and we're going to go through the old grid, copying over non-cleanup entries to the new one.
	//Once that's done, we're going to delete the old grid, then set the new one in place as the changes grid for this changelist.
	
	//First and foremost, we only want to copy over if there was actually any cleaning done. Across hundreds of changelists, this can save a LOT of work.
	if (_cleaned)
	{
		var _new = ds_grid_create(4, 0);
		var _iTime, _iArg;
	
		for (_i = 0; _i < _h; _i++)
		{
			//So we grab the command from each row.
			_iCom = ds_grid_get(changes, changeListColumns.command, _i)
		
			//If it's NOT a cleanup entry...
			if (_iCom != changeListCommands.cleanUp)
			{
				//... then it's time to copy it! Let's start by adding a new row to the _new grid.
				mDsGridAddRow(_new);
				_iTar = ds_grid_get(changes, changeListColumns.target, _i);
				_iTime = ds_grid_get(changes, changeListColumns.time, _i);
				_iArg = ds_grid_get(changes, changeListColumns.arg, _i);
			
				var _newHeight = ds_grid_height(_new);
				ds_grid_set(_new, changeListColumns.command, _newHeight - 1, _iCom);
				ds_grid_set(_new, changeListColumns.target, _newHeight - 1, _iTar);
				ds_grid_set(_new, changeListColumns.time, _newHeight - 1, _iTime);
				ds_grid_set(_new, changeListColumns.arg, _newHeight - 1, _iArg);
			
			}
		}
	
		//The noncleanup entries are copied over. Let's delete the old grid and set the new one in its place.
		ds_grid_destroy(changes);
		changes = _new;
	}
}