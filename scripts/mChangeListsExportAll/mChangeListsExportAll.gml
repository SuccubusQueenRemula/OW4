///@description Writes every single changelist out to JSON.


with (oChangeListHandler)
{
	//Get the first and last keys.
	var _first = ds_map_find_first(changeLists);
	var _last = ds_map_find_last(changeLists);
	var _map = ds_map_create();
	
	
	//Grab the first changelist.
	var _cl = ds_map_find_value(changeLists, _first);
	
	//If the first changelist is undefined, then there are NO changelists.
	//I have no fucking clue why this would be the case ever, but uh... yeah. Return the empty map if that happens.
	if (is_undefined(_cl))
	{
		return json_encode(_map);
		ds_map_destroy(_map);
	}
	
	//So if we got here, there actually is a changelist. Let's convert it to a map of its own.
	var _json = mChangeListExportToJSON(_cl);
	var _current = _first;
	
	ds_map_set(_map, _first, _json);
	
	while (_current != _last)
	{
		_current = ds_map_find_next(changeLists, _current);
		_cl = ds_map_find_value(changeLists, _current);
		_json = mChangeListExportToJSON(_cl);
		ds_map_set(_map, _current, _json);
	}
	
	_json = json_encode(_map);
	ds_map_destroy(_map);
	
	return _json;
}