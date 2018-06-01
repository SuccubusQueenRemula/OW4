var _file = file_text_open_read("sav1.json");
var _string = "";

while (!file_text_eof(_file))
{
	_string += file_text_readln(_file);
}



testSaveFile = json_decode(_string);
changeLists =  -1;

