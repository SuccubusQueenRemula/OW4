///@description Converts a single changelist to JSON.
///@arg changeList - The changelist to convert.

var _cl = argument0;

//Activate the changelist.
instance_activate_object(_cl);

//This is basically the json object that will represent the entire map.
var _CLmap = ds_map_create();


if (_cl.chunkX == 1000 && _cl.chunkY == 1000)
{
	var _stopHere = true;
}

//At its topmost level, it gets some basic data: the x and y of the chunk it applies to. Aditionally, it gets a ds_list for all changes.
ds_map_set(_CLmap, "chunkX", _cl.chunkX);
ds_map_set(_CLmap, "chunkY", _cl.chunkY);
var _changes = ds_map_create();


//Now we grab the height of the changelist.
var _h = ds_grid_height(_cl.changes);

//... and we start iterating through the changes. 
for (var _i = 0; _i < _h; _i++)
{
	//For each entry, we create a map and fill it with the parameters.
	var _entry = ds_map_create();
	ds_map_set(_entry, "command", ds_grid_get(_cl.changes, changeListColumns.command, _i));
	ds_map_set(_entry, "target", ds_grid_get(_cl.changes, changeListColumns.target, _i));
	ds_map_set(_entry, "time", ds_grid_get(_cl.changes, changeListColumns.time, _i));
	ds_map_set(_entry, "arg", ds_grid_get(_cl.changes, changeListColumns.arg, _i));
	
	//Then, once the map is filled with this entry, we encode it and add that code as the value to the changes map, with the key being which index number it is.
	ds_map_set(_changes, string(_i), json_encode(_entry));
	ds_map_destroy(_entry);
}

//With the list written, we set it as a value for the map.
ds_map_set(_CLmap, "changes", json_encode(_changes));

//The data is recorded. Encode it.
var _json = json_encode(_CLmap);

//Now we gotta start destroying/deactivating the data.
ds_map_destroy(_changes);
ds_map_destroy(_CLmap);
instance_deactivate_object(_cl)

//And at long last, we can return the JSON.
return _json;