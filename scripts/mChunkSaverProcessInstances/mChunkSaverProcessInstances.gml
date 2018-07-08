///@description To be called by oWorldChunkSaver. Checks all instances in the chunk saver room and ensures they are a processable type. Basically an active, tangible instance in game. Then preps them to be saved in the chunk's text file.

//This will need the list index of the instance list being used by the chunk saver, as other instances are about to take over.
var _list = instanceList;


var _CHIDNumber = 0;
with (all)
{
	//Ensure this is not the world chunk saver, a tile, a wall, or a device, or the MultiChunkBuilder
	if (!object_is_ancestor(object_index, oChunkCreatorTile) 
	&& object_index != oWorldChunkSaver 
	&& !object_is_ancestor(object_index, oDevice)
	&& object_index != oMultiChunkBuilder
	&& !object_is_ancestor(object_index, oChunkCreatorTerrainWall)
	&& !object_is_ancestor(object_index, oChunkCreatorTerrainEdge)
	&& !object_is_ancestor(object_index, oChunkCreatorTerrainDecorum)
	&& !object_is_ancestor(object_index, oChunkCreatorOverheadDecorum)
	&& !object_is_ancestor(object_index, oChunkCreatorOverheadRoof)
	&& !object_is_ancestor(object_index, oChunkCreatorOverheadParallaxItem)
	&& object_index != oInventory
	&& object_index != oOverheadParallaxContainer)
	{
		var _instanceMap = ds_map_create();
		//Store the name of this instance's object type.
		ds_map_set(_instanceMap, "objectName", object_get_name(object_index));
		//Store this instance's x and y positions relative to the topleft of this chunk.
		ds_map_set(_instanceMap, "instanceX", x);
		ds_map_set(_instanceMap, "instanceY", y);
		//Store instance's xscale and yscale.
		ds_map_set(_instanceMap, "instanceXScale", image_xscale);
		ds_map_set(_instanceMap, "instanceYScale", image_yscale);
		ds_map_set(_instanceMap, "CHIDNumber", _CHIDNumber);
		_CHIDNumber++;
		
		//If this is an NPC, we also need to save its conversation data.
		if (object_is_ancestor(object_index, oConversationNPC))
		{
			ds_map_set(_instanceMap, "initialGreeting", initialGreeting);
			ds_map_set(_instanceMap, "initialPortrait", initialPortrait);
			ds_map_set(_instanceMap, "conversationFile", conversationFile);
		}
		
		//If this is an item just laying on the ground...
		if (object_index == oInventoryItemSaver)
		{
			//The big one we really care about is what item file it connects to.
			ds_map_set(_instanceMap, "itemFile", itemFile);
			//Also, we don't want to save this as an item saver, but as an actual item.
			//So we overwrite the old objectName map entry and force in Item.
			ds_map_set(_instanceMap, "objectName",  object_get_name(oInventoryItem));
		}
		
		var _mapString = json_encode(_instanceMap);
		//Add the completed instance map to the list.
		ds_list_add(_list, _mapString);
		ds_map_destroy(_instanceMap);
	}
}

//Add the list of instance to the map, then destroy it.
ds_map_set(chunkInfo, "chunkInstances", ds_list_write(instanceList));
ds_list_destroy(instanceList);