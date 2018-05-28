///@arg loadingWorldChunk - the world chunk to load info into.
///@arg worldChunkX - The leftmost pixel of this world chunk.
///@arg worldChunkY - The topmost pixel of this world chunk.
///@arg chunkInfo - The ds_map containing the info to populate the chunk with.
///@arg chunkName - The name of this chunk for giving CHIDs.

var _loadingWorldChunk = argument0;
var _chunkX = argument1;
var _chunkY = argument2;
var _chunkInfo = argument3;
var _chunkName = argument4;


_loadingWorldChunk.x = _chunkX;
_loadingWorldChunk.y = _chunkY;

//Let's just double check that nothing happened to the chunkfileInfo. Should still be a ds_map.
if (ds_exists(_chunkInfo, ds_type_map))
{
	//Grab the string that represents the tilegrid.
	var _chunkTilesString = ds_map_find_value(_chunkInfo, "chunkTiles");
	
	//Destroy the default tile grid plugged into the loading chunk and replace with this one.
	if (variable_instance_exists(_loadingWorldChunk, "tileGrid") && ds_exists(_loadingWorldChunk.tileGrid, ds_type_grid))
	{
		ds_grid_destroy(_loadingWorldChunk.tileGrid);
	}
	
	var _newTileGrid = ds_grid_create(16, 16);
	ds_grid_read(_newTileGrid, _chunkTilesString);
	
	
	
	//Get the grid width/height
	var _gridHeight = ds_grid_height(_newTileGrid);
	var _gridWidth = ds_grid_width(_newTileGrid);
	
	//We will be converting each item in the grid from the NAME of a sprite to an actual sprite ID.
	//todo: This is slow but it's the only way to safely ensure that when a chunk is designed/edited, that
	//the assets match up in case their index has changed.
	var _value = noone;
	var _sprite = noone;
	
	for (var _yy = 0; _yy < _gridHeight; _yy++)
	{
		for (var _xx = 0; _xx < _gridWidth; _xx++)
		{
			var _value = ds_grid_get(_newTileGrid, _xx, _yy);
			_sprite = asset_get_index(_value);
			ds_grid_set(_newTileGrid, _xx, _yy, _sprite);
		}
	}
	
	var _instanceListString = ds_map_find_value(_chunkInfo, "chunkInstances");
	var _instanceList = ds_list_create();
	ds_list_read(_instanceList, _instanceListString);
	
	var _listLength = ds_list_size(_instanceList);
	
	var _instance = noone;
	var _instanceIndex = noone;
	
	//The list has been decoded. It contains several ds_maps, each of which holds an instance.
	for (var _i = 0; _i < _listLength; _i++)
	{
		//Pull the value from the list.
		_value = ds_list_find_value(_instanceList, _i);
		
		//Turn the value into a map.
		_instance = json_decode(_value);
		
		var _objectName = ds_map_find_value(_instance, "objectName");
		var _objectIndex = asset_get_index(_objectName);
		var _xCoord = ds_map_find_value(_instance, "instanceX");
		var _yCoord = ds_map_find_value(_instance, "instanceY");
		var _xScale = ds_map_find_value(_instance, "instanceXScale");
		var _yScale = ds_map_find_value(_instance, "instanceYScale");
		var _CHIDNumber = ds_map_find_value(_instance, "CHIDNumber");
		
		//Now we actually make the instance.	
		var _createdInstance = instance_create_layer(_chunkX + _xCoord, _chunkY + _yCoord, "Instances", _objectIndex);
		_createdInstance.CHID = _chunkName + string(_CHIDNumber);
		_createdInstance.image_xscale = _xScale;
		_createdInstance.image_yscale = _yScale;
		var _oType = _createdInstance.object_index;
		
		#region Device
		//Now, if this is an object device, we assign its parent to be this chunk.
		if (object_is_ancestor(_createdInstance.object_index, oDevice))
		{
			_createdInstance.parentChunk = _loadingWorldChunk;	
		}
		#endregion Device
		
		#region ConversationNPC
		//If this is a conversation NPC, we need to load its data.
		if (object_is_ancestor(_createdInstance.object_index, oConversationNPC))
		{
			with (_createdInstance)
			{
				conversationFile = ds_map_find_value(_instance, "conversationFile");
				initialGreeting = ds_map_find_value(_instance, "initialGreeting");
				initialPortrait = ds_map_find_value(_instance, "initialPortrait");
				mLoadConversationNPC();
			}
		}
		#endregion ConversationNPC
		
		#region InventoryItem
		if (object_is_ancestor(_createdInstance.object_index, oInventoryItem) || _createdInstance.object_index == oInventoryItem)
		{
			with (_createdInstance)
			{
				var _itemFile = ds_map_find_value(_instance, "itemFile");
				mLoadItemFromFile(_createdInstance, _itemFile);
			}
		}
		#endregion InventoryItem
		
		//If this instance already existed, delete it.
		var _instanceDeleted = false;
		with (_oType)
		{
			if (variable_instance_exists(id, "CHID") && !_instanceDeleted)
			{
				if (CHID == _createdInstance.CHID && id != _createdInstance)
				{
					instance_destroy(_createdInstance);
					_createdInstance = noone;
					_instanceDeleted = true;
				}
			}
		}
		
		//If this instance still exists, then it wasn't deleted as a result of duplication. We can add it to the instance map for this chunk.
		if (_createdInstance != noone)
		{
			ds_map_set(_loadingWorldChunk.instanceMap, _createdInstance.CHID, _createdInstance);
		}
		
		_createdInstance = noone;
		//Destroy the ds_map, of course.
		ds_map_destroy(_instance);
	}
	ds_list_destroy(_instanceList);
	
	//Now we assign this grid so it can't be forgotten.
	_loadingWorldChunk.tileGrid = _newTileGrid;
}
