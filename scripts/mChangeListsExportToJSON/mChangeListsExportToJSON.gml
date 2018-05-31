///@description Writes every single changelist out to JSON.


with (oChangeListHandler)
{
	//Get the first and last keys.
	var _first = ds_map_find_first(changeLists);
	var _last = ds_map_find_last(changeLists);
	
	json_encode
	
	var _current = _first;
	
	while (_current != _last)
	{
		_current = ds_map_find_next(changeLists, _current);
	}
}