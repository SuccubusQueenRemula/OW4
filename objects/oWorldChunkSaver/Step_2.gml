//Save all tiles to the map by their sprite name and index.


//The amount of tiles in a row is the pixel-width of a chunk divided by the pixel size of tiles.
var _tilesWidth = global.chunkWidth / global.tileSize;
//Likewise for the tiles in a column.
var _tilesHeight = global.chunkHeight / global.tileSize;
//Now we create a grid of that size.
var _chunkCreatorTiles = ds_grid_create(_tilesWidth, _tilesHeight);

//The list that will store ALL devices.
var _deviceList = ds_list_create()
//A reused map that stores an individual device, to be added to the list.
var _deviceMap = noone;

var _tilePosX = 0;
var _tilePosY = 0;

#region StoreTilesToGrid
with (oChunkCreatorTile)
{
	//The coordinate each tile will belong in the grid is their room position over the tile size.
	_tilePosX = x / global.tileSize;
	_tilePosY = y / global.tileSize;

	//Now just add that sprite's name to the grid at this position.
	//We don't worry about ID until we load it, which will let rendering it load faster.
	ds_grid_set(_chunkCreatorTiles, _tilePosX, _tilePosY, sprite_get_name(sprite_index));
}
#endregion StoreTilesToGrid



//We now create a list for the instances. Each item in the list will be a map.
var _instanceList = ds_list_create();
var _instanceMap = noone;

var _CHIDNumber = 0;
with (all)
{
	if (object_index == oSolid)
	{
		stophere = true;
	}
	if (object_index == oCliffBottomCenter)
	{
		stophere = true;
	}
	//Ensure this is not the world chunk saver, a tile, or a device, or the MultiChunkBuilder
	if (!object_is_ancestor(object_index, oChunkCreatorTile) 
	&& object_index != oWorldChunkSaver 
	&& !object_is_ancestor(object_index, oDevice)
	&& object_index != oMultiChunkBuilder)
	{
		_instanceMap = ds_map_create();
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
		ds_list_add(_instanceList, _mapString);
		ds_map_destroy(_instanceMap);
	}
}

//Add the list of tiles to the map, then destroy it.
ds_map_set(chunkInfo, "chunkTiles", ds_grid_write(_chunkCreatorTiles));
//Add the list of instance to the map, then destroy it.
ds_map_set(chunkInfo, "chunkInstances", ds_list_write(_instanceList));
ds_grid_destroy(_chunkCreatorTiles);


//Get the X and Y of the chunk from the room name.
var _roomName = room_get_name(room);
var _roomProps = ds_list_create();
mStringSplit(_roomName, "_", _roomProps);
var _XAndY = ds_list_find_value(_roomProps, 0);
var _chunkName = ds_list_find_value(_roomProps, 1);
ds_list_destroy(_roomProps);
var _chunkX = "";
var _chunkY = "";
var _onX = true;

for (var _i = 0; _i < string_length(_XAndY); _i++)
{
	var _char = string_char_at(_XAndY, _i + 1);
	if (_char == "X" || _char == "c" || _char == "x")
	{
		continue;
	}
	else if (_char == "Y" || _char == "y")
	{
		_onX = false;
		continue;
	}
	else
	{
		if (_onX)
		{
			_chunkX += _char;
		}
		else
		{
			_chunkY += _char;
		}
	}
}


 
//Save the map as a json string, then save it to a file.
ds_map_add(chunkInfo, "chunkName", _chunkName);
var _mapString = json_encode(chunkInfo);
 
var _file = file_text_open_write(working_directory + "/" + "World" +  "/" + "X" + _chunkX + "Y" + _chunkY + ".json");
file_text_write_string(_file, _mapString);
file_text_close(_file);

//With the map fully saved, destroy it.
ds_map_destroy(chunkInfo);

//Destroy each map in the instance list.
var _listHeight = ds_list_size(_instanceList);
for (var _i = 0; _i < _listHeight; _i++)
{
	//ds_map_destroy(ds_list_find_value(_instanceList, _i));
}
//Destroy the instance list itself.
ds_list_destroy(_instanceList);




//Determine whether to close this or not based on if this is a full world build.
if (instance_exists(oMultiChunkBuilder))
{
	with (oMultiChunkBuilder)
	{
		//Call the code to begin the next room.
		event_user(0);
	}
}
else
{
	game_end();
}