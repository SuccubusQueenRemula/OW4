///@description To be called by changelists. Attempts to apply each item in the changelist.
///@arg loadingWorldChunk - The world chunk this change list is applied to.


var _loadingWorldChunk = argument0;

var _h = ds_grid_height(changes);
var _i = 0;

//This will be reading each row of the changes grid.
for (_i = 0; _i < _h; _i++)
{
	//Grab the command of this change from the first column of this row.
	var _command = ds_grid_get(changes, changeListColumns.command, _i);
	
	//Oh, and uh, also get the other data, probably.
	var _target = ds_grid_get(changes, changeListColumns.target, _i);
	var _time = ds_grid_get(changes, changeListColumns.time, _i);
	var _arg = ds_grid_get(changes, changeListColumns.arg, _i);
	
	
	
	
	//The behavior from here will be based on what that command is.
	switch (_command)
	{
		case changeListCommands.removeInstanceByCHID:
			//We know the CHID of the instance to be destroyed. Thus, we can try to grab it from the map.
			var _instance = ds_map_find_value(_loadingWorldChunk.instanceMap, _target);
			
			//If this value from the map is legit, we delete it.
			if (!is_undefined(_instance))
			{
				instance_destroy(_instance);
			} 
			break;
		
		case changeListCommands.addInvItemCHIDAndFile:
			var _item = instance_create_layer(0, 0, "Instances", oInventoryItem);
			_item.CHID = _target;
			mLoadItemFromFile(_item, _arg)
			ds_map_set(_loadingWorldChunk.instanceMap, _target, _item);
			break;
			
		case changeListCommands.addInvItemCHIDAndFileUpdateX:
			var _instance = ds_map_find_value(_loadingWorldChunk.instanceMap, _target);
			
			if (!is_undefined(_instance))
			{
				_instance.x = _loadingWorldChunk.x + _arg;
			}
			break;
			
		case changeListCommands.addInvItemCHIDAndFileUpdateY:
			var _instance = ds_map_find_value(_loadingWorldChunk.instanceMap, _target);
			
			if (!is_undefined(_instance))
			{
				_instance.y = _loadingWorldChunk.y + _arg;
			}
			break;
		
		default:
			break;
	}
}