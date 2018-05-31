var _file = file_text_open_read("sav1.json");
var _string = "";

while (!file_text_eof(_file))
{
	_string += file_text_readln(_file);
}



soandso = json_decode(_string);
changeLists = json_decode(ds_map_find_value(soandso, "changeLists"));

var _stopHere = true;
