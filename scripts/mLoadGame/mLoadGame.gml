//Load the data of the save file from disk into memory.
var _file = file_text_open_read("sav1.json");
var _map = json_decode(file_text_read_string(_file));

//Let's get this load going. We're basically going to reload the entire world, so before that we totally
//destroy the existing world.
mObliterateWorld();

//Now we gotta grab the X and Y of the center chunk where this save took place at.
var _worldX = ds_map_find_value(_map, "worldX");
var _worldY = ds_map_find_value(_map, "worldY");

//Positions will be pretty messed up without the offset.
var _offsetX = ds_map_find_value(_map, "worldOffsetX");
var _offsetY = ds_map_find_value(_map, "worldOffsetY");
global.worldChunkOffsetX = _offsetX;
global.worldChunkOffsetY = _offsetY;

//Using that, we load a new world!
mLoadWorldAtCenterChunk(_worldX, _worldY);



var _centerChunk = ds_grid_get(oWorldHandler.worldChunks, 1, 1);



with (oPlayer)
{
	var _x = ds_map_find_value(_map, "chunkX");
	var _y = ds_map_find_value(_map, "chunkY");
	
	var _cx = _centerChunk.x;
	var _cy = _centerChunk.y;
	
	x = _cx + _x;
	y = _cy + _y;
}

file_text_close(_file);
ds_map_destroy(_map);