///@description Used as part of loading from a save file. Given an empty changelist object and a map of changelist data, populates the changelist.
///@arg changeList - the changelist to fill with data.
///@arg data - The data to load into a changelist.

var _cl = argument0;
var _data = argument1; 

with (_cl)
{
	//Plug in basic data.
	chunkX = ds_map_find_value(_data, "chunkX");
	chunkY = ds_map_find_value(_data, "chunkY");
	
	//Grab the list of change maps and gets its height.
	var _changes = ds_map_find_value(_data, "changes");
	var _h = ds_list_size(_changes);
	
	//Prep these vars ahead of time.
	var _map, _tar, _com, _arg, _time;
	
	//For each index in the list, grab the map inside, then plug it in as entry in _cl's changelist
	for (var _i = 0; _i < _h; _i++)
	{
		//Pull the map at this index.
		_map = ds_list_find_value(_changes, _i);
		
		//Retrieve the data from the map.
		_tar = ds_map_find_value(_map, "target");
		_com = ds_map_find_value(_map, "command");
		_arg = ds_map_find_value(_map, "arg");
		_time = ds_map_find_value(_map, "time");
		
		//Add a new changelist entry with the retreived data.
		mAddChangeToList(_com, _tar, _time, _arg);
	}
}


