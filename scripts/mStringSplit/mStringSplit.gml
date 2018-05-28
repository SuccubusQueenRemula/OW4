///@description Splits a string at every instance of a given character, then adds each string formed by the split to a ds_list.
///@arg stringToSplit
///@arg delimiter
///@arg dsList

//The character the string will be split on.
var _string = argument0;
var _delimiter = argument1;
//We could return the list in theory, but I want to ensure it can't be lost in memory.
var _splitList = argument2;
var _listIndex = 0;
var _charIndex = 0;
var _char = "";


ds_list_clear(_splitList);
//For every character in the string....
for (_charIndex = 1; _charIndex <= string_length(_string); _charIndex++)
{
	_char = string_char_at(_string, _charIndex);
	
	//... check if it matches the delimiter.
	if (_char == _delimiter)
	{
		//If it's the very first entry, then we just formatted our delimiters to split on the first item. Do nothing this iteration.
		if (_listIndex == 0 && _charIndex == 1)
		{
			continue;
		}
		else
		//But if we DIDN'T just start, then it's time to break the string here.
		{
			_listIndex++;
		}
	}
	else
	{
		//Is the character NOT the delimiter? Then append this character onto the end of the string at the current list index.
		//Check if that index exists at the list.
		if (ds_list_size(_splitList) != _listIndex + 1)
		{
			//If not, this is a new line. Just add this char as the start of a new split.
			ds_list_add(_splitList, _char);
		}
		else
		{
			//If it exists, though, we append it to the end of the current string
			var _line = ds_list_find_value(_splitList, _listIndex);
			_line += _char;
			ds_list_set(_splitList, _listIndex, _line);
		}
	}
}
//var delimiterLocation = string_pos("*", nextPhase);


////Clear the phase command and phase data before we load the new stuff in.
//scenManager.phaseCommand = "";
//scenManager.phaseData = "";

////Load the phasesCommand.
//for (i = 1; i < delimiterLocation; i++)
//{
//	scenManager.phaseCommand += string_char_at(nextPhase, i);
//}
//scenManager.phaseCommand = scrStringTrim(scenManager.phaseCommand);
