///@arg mapToParseTo

//This list is every single step of a scenario.
var _map = argument0;
//First, we connect to the file for this NPC. Currently, this is hard-coded.
var _file = file_text_open_read("test_npc2.json");
var _line = "";
var _list = ds_list_create();
//Now we read the text of the file line by line until none is left.
while(!file_text_eof(_file))
{
	//First, we clear the list for this line.
	ds_list_clear(_list);
	//Make sure to trim each line in case of white space.
	_line = mStringTrim(string(file_text_readln(_file)));
	//Now we split the line between its key and value.
	mStringSplit(_line, "$", _list);
	//With that done, we can add the value to the map.
	ds_map_add(_map, ds_list_find_value(_list, 0), ds_list_find_value(_list, 1));
}

ds_list_destroy(_list);

//The map is now made. The value contains a variety of arguments, but those are loaded when the keyword is asked about.