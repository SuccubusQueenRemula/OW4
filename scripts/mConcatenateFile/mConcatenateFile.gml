///@description Usually used with JSON files (since GML can only read JSON as a single line). Takes a file and returns a string with the entire file in one line.
///@arg fileName - The file to concatenate.

var _fileName = argument0;
var _file = noone;
var _text = "";

//GML doesn't seem to care if the strings aren't trimmed, so I'm not gonna waste the extra processing power doing so.
//Later on, we can trim the individual data elements if needed.
if (file_exists(_fileName))
{
	_file = file_text_open_read(_fileName);
	while (!file_text_eof(_file))
	{
		_text += file_text_readln(_file);
	}
	file_text_close(_file);
	return _text;
	
}
else 
{
	return noone;
}