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
		
	}
	
	
	ds_grid_destroy(masterDsGrid);
}

