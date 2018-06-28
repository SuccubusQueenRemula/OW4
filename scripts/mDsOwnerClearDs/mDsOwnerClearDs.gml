///@description Checks if the current instance is a DsOwner. If it is, clears all of its DSs.

if (mIsDsOwner())
{
	var _h = ds_grid_height(masterDsGrid);
	
	var _type, _name, _num, _varVal;
	
	for (var _i = 0; _i < _h; _i++)
	{
		_type = ds_grid_get(masterDsGrid, MasterDsGridColumns.Type, _i);
		_name = ds_grid_get(masterDsGrid, MasterDsGridColumns.Name, _i);
		_num = ds_grid_get(masterDsGrid, MasterDsGridColumns.Number, _i);
		_varVal = variable_instance_get(id, _name);
		
		//We ensure both a ds of the type exists for that number AND that the variable by this name at this instance matches that number.
		//By doing this, we can be pretty damned sure that it's the proper data type and it's also the original.
		if (ds_exists(_num, _type && _varVal == _num))
		{
			switch (_type)
			{
				case ds_type_list:
					ds_list_destroy(_num);
					break;
				
				case ds_type_grid:
					ds_grid_destroy(_num);
					break;
				
				case ds_type_queue:
					ds_queue_destroy(_num);
					break;
				
				case ds_type_priority:
					ds_priority_destroy(_num);
					break;
				
				case ds_type_stack:
					ds_stack_destroy(_num);
					break;
				
				case ds_type_map:
					ds_map_destroy(_num);
					break;
			}
		}
		//Hrm... If we go into this else, it means we detected a reason NOT to attempt to delete a data structure here.
		//Let's determine the precise reason and report it to the client log.
		else
		{
			//WARNING: These are going to be slow as hell to write, but they're mostly made for us to keep DS memory clear. Hopefully if the game goes live, these won't ever be needed.
			//Report if this number wasn't detected to be a DS of the proper type.
			if (!ds_exists(_num, _type))
			{			
				mClientLogAddEntry("ERROR: AGC tried to clean a non-existent DS. Index was " + string(_num) + ". Expected DS type was " + string(_type) + ". Object index type was " + object_get_name(object_index));
			}
			//Report if the value originally storing the ds seems to have changed.
			if (_varVal != _num)
			{
				mClientLogAddEntry("ERROR: AGC detected that a DS-assigned variable had changed value after assignment. Expected number to be " + string(_num) + " but got " + string(_varVal) + ". Object type was " + object_get_name(object_index) + " and variable name was " + string(_name));
			}
		}
		
	}
	
	
	//Also make sure to destroy the master DS grid. Lest we just wind up with a new memory leak issue.
	ds_grid_destroy(masterDsGrid);
}