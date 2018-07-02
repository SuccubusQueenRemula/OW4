///@description Apply changelists.

if (!haltLoad)
{

	//First, we need to see if any changelist exists. The key for all changelists is just the file name of the chunk.
	var _changeList = noone;
	var _file = chunkFile;
	var _loadingWorldChunk = loadingWorldChunk;


	//If it's still undefined, we'll create a new changelist and add it to the map.
	_changeList = mChangeListFindOrCreate(_loadingWorldChunk.xCoord, _loadingWorldChunk.yCoord);




	//Check against any weird wonky error with the above method.
	if (_changeList == noone)
	{
		exit;
	}

	//Now we start applying the individual changelists.
	with (_changeList)
	{
		//If the changelist's changes are erroneous, then we fix than and don't apply anything.
		if (changes == noone || !ds_exists(changes, ds_type_grid))
		{
			changes = ds_grid_create(4, 0);
			instance_deactivate_object(_changeList);
			exit;
		}
			
		//Do the meat and potatoes of the work now.
		mChangeListApplyChanges(_loadingWorldChunk);
		instance_deactivate_object(_changeList);
	
	
	}
}

else
{
	mClientLogAddEntry("Apply CL operation cancelled. Chunk loader was already destroyed.");
}