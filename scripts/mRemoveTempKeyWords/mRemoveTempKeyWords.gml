var _start = 0;
var _count = 0;
var _value = noone;

with (oConversationHandler)
{
	//First, let's count how many temporary keywords are in the list.
	for (var _i = 0; _i < ds_grid_height(knownKeyWords); _i++)
	{
		_value = ds_grid_get(knownKeyWords, 1, _i);
		if (_value == keyWordPriority.temporary)
		{
			_count++;	
		}
	}
	
	//With that knowledge, we can make a new grid. We can base its height off the removed temp keywords.
	var _newGrid = ds_grid_create(2, ds_grid_height(knownKeyWords) - _count);
	
	//Now we can loop through the grid again, and for every word that ISN'T temp, we add it to the new grid.
	var _j = 0;
	var _word = "";
	for (var _i = 0; _i < ds_grid_height(knownKeyWords); _i++)
	{
		_value = ds_grid_get(knownKeyWords, 1, _i);
		if (_value != keyWordPriority.temporary)
		{
			_word = ds_grid_get(knownKeyWords, 0, _i);
			ds_grid_add(_newGrid, 0, _j, _word);
			ds_grid_add(_newGrid, 1, _j, _value);
			_j++;
		}
	}
	
	//So now the original grid has been copied minus the temp items. So let's delete the original.
	ds_grid_destroy(knownKeyWords);
	//Now we set the original to reference the new one and then sort it.
	knownKeyWords = _newGrid;
	mSortKnownKeyWords();
	
}

