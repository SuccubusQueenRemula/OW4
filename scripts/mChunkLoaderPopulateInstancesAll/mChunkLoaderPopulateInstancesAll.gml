///@description Handles the loading of all instances during a chunk load.
///@arg chunk - the loading chunk.
///@arg str - the string to convert to a list.
///@arg chunkX
///@arg chunkY

//Apply args. TODO: why so fucking many? This is still a part of cleaning up chunks to have knowledge of their own damned coords
var _chunk = argument0;
var _str = argument1;
var _chunkX = argument2;
var _chunkY = argument3;
var _chunkName = argument4;



//Read the list.
var _list = ds_list_create();
ds_list_read(_list, _str);

//Prep the length and a few other vars.
var _size = ds_list_size(_list);

var _instance = noone;
var _instanceIndex = noone;
var _value = noone;
var _instance

//The list contains several ds_maps, each of which holds an instance.
for (var _i = 0; _i < _size; _i++)
{
	//Pull the value from the list.
	_value = ds_list_find_value(_list, _i);
	
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
	//TODO: Turn each instance load into a separate submethod.
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
		ds_map_set(_chunk.instanceMap, _createdInstance.CHID, _createdInstance);
	}
		
	_createdInstance = noone;
	//Destroy the ds_map, of course.
	ds_map_destroy(_instance);
	
}

//Unlike the terrain and overhead, this will not need to be remade later. Destroy it.
ds_list_destroy(_list);