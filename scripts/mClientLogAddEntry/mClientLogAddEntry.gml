///@description Adds a line to the ClientLog.
///@arg text - the text to add


with (oGame)
{
	if (file_exists("clientLog.txt"))
	{
		if (is_string(argument0))
		{	
			var _file = file_text_open_append("ClientLog.txt");
			var _str = date_time_string(date_current_datetime()) + ": " + string(argument0); 
			file_text_write_string(_file, _str);
			file_text_writeln(_file);
			file_text_close(_file);
		}

		else
		{
			file_text_write_string(_file, "WARNING - Attempted to write non-string value to client log.");
			file_text_writeln(_file);
		}
	}
	else
	{
		var _file = file_text_open_append("ClientLog.txt");
		var _str = date_time_string(date_current_datetime()) + ": " + "WARNING - ClientLog was not found found when attempting to add entry. Intended entry is next line.";
		file_text_write_string(_file, _str);
		file_text_writeln(_file);
		_str = date_time_string(date_current_datetime()) + ": " + string(argument0); 
		file_text_write_string(_file, _str);
		file_text_writeln(_file);
		file_text_close(_file);
	}
}