//Load the data of the save file from disk into memory.
var _file = file_text_open_read("sav1.json");
var _map = json_decode(file_text_read_string(_file));

//Let's get this load going. We're basically going to reload the entire world, so before that we totally
//destroy the existing world
mDestroyAllChangeLists();
mObliterateWorld();

//Now we gotta grab the X and Y of the center chunk where this save took place at.
var _worldX = ds_map_find_value(_map, "worldX");
var _worldY = ds_map_find_value(_map, "worldY");

//Positions will be pretty messed up without the offset.
var _offsetX = ds_map_find_value(_map, "worldOffsetX");
var _offsetY = ds_map_find_value(_map, "worldOffsetY");
global.worldChunkOffsetX = _offsetX;
global.worldChunkOffsetY = _offsetY;


//Before we can load the world, we need to make sure we load all the changelists.
#region LoadChangeLists
var _changeLists = ds_map_find_value(_map, "changeLists");

var _firstKey = ds_map_find_first(_changeLists)
var _currentKey = _firstKey;
var _lastKey = ds_map_find_last(_changeLists);

var _dataChangeList = ds_map_find_value(_changeLists, _firstKey)

var _cl = instance_create_depth(0, 0, Depths.LogicItems, oChangeList);

//Load the data into the changelist, add the changelist to the changelist handler's CLs, and then deactivate the CL.
mLoadChangeListData(_cl, _dataChangeList);
ds_map_set(oChangeListHandler.changeLists, "X" + string(_cl.chunkX) + "Y" + string(_cl.chunkY) + CHUNK_FILE_EXT, _cl);
instance_deactivate_object(_cl);

//Then, using the keys, repeat this for every remaining CL to load.
while (_currentKey != _lastKey)
{
	_cl = instance_create_depth(0, 0, Depths.LogicItems, oChangeList);
	_currentKey = ds_map_find_next(_changeLists, _currentKey);
	_dataChangeList = ds_map_find_value(_changeLists, _currentKey)
	mLoadChangeListData(_cl, _dataChangeList);
	ds_map_set(oChangeListHandler.changeLists, "X" + string(_cl.chunkX) + "Y" + string(_cl.chunkY) + CHUNK_FILE_EXT, _cl);
	instance_deactivate_object(_cl);
}
#endregion LoadChangeLists




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