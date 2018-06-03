///@description Given a save file map, loads all changelists.
///@arg saveMap - the ds_map of json_decoded save file.

_map = argument0;

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