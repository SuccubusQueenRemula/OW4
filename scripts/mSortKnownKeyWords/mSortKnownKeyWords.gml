with (oConversationHandler)
{
	//Create the five buckets
	var _nameList = ds_list_create();
	var _jobList = ds_list_create();
	var _byeList = ds_list_create();
	var _tempList = ds_list_create();
	var _favoriteList = ds_list_create();
	var _regularList = ds_list_create();
	//Begin parsing the words into respective buckets
	var _newHeight = ds_grid_height(knownKeyWords);
	var _sortWord = "";
	for (var _i = 0; _i < _newHeight; _i++)
	{
		_sortWord = ds_grid_get(knownKeyWords, 0, _i);
			
		switch (ds_grid_get(knownKeyWords, 1, _i))
		{
			case keyWordPriority.name:
				ds_list_add(_nameList, _sortWord);
				break;
					
			case keyWordPriority.job:
				ds_list_add(_jobList, _sortWord);
				break;
					
			case keyWordPriority.bye:
				ds_list_add(_byeList, _sortWord);
				break;
					
			case keyWordPriority.temporary:
				ds_list_add(_tempList, _sortWord);
				break;
					
			case keyWordPriority.favorite:
				ds_list_add(_favoriteList, _sortWord);
				break;
					
			case keyWordPriority.normal:
				ds_list_add(_regularList, _sortWord);
				break;
					
		}
	}
		
	//Sort the six buckets
	ds_list_sort(_nameList, true);
	ds_list_sort(_jobList, true);
	ds_list_sort(_byeList, true);
	ds_list_sort(_favoriteList, true);
	ds_list_sort(_tempList, true);
	ds_list_sort(_regularList, true);
		
	_i = 0;
	var _j = 0;
	repeat (ds_list_size(_nameList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_nameList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.name);
		_i++;
		_j++;
	}
		
	_j = 0;
		
	repeat (ds_list_size(_jobList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_jobList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.job);
		_i++;
		_j++;
	}
		

	_j = 0;
		
	repeat (ds_list_size(_byeList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_byeList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.bye);
		_i++;
		_j++;
	}
		
		
	_j = 0;
	
	repeat (ds_list_size(_tempList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_tempList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.temporary);
		_i++;
		_j++;
	}
		
	_j = 0;
		
	repeat (ds_list_size(_favoriteList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_favoriteList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.favorite);
		_i++;
		_j++;
	}
		
	_j = 0;
	
		
	repeat (ds_list_size(_regularList))
	{
		ds_grid_set(knownKeyWords, 0, _i, ds_list_find_value(_regularList, _j));
		ds_grid_set(knownKeyWords, 1, _i, keyWordPriority.normal);
		_i++;
		_j++;
	}
		
		
		
	ds_list_destroy(_nameList);
	ds_list_destroy(_jobList);
	ds_list_destroy(_byeList);
	ds_list_destroy(_favoriteList);
	ds_list_destroy(_tempList);
	ds_list_destroy(_regularList);
}