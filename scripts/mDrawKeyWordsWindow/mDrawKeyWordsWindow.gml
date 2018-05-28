///@description Draws known keywords to a window during a conversation, handling the index of the selected word.
///@arg winX - The X of the window to draw the keywords to.
///@arg winY - The Y of the window to draw the keywords to.
///@arg winW - The width of the window to draw the keywords to.
///@arg winH - The height of the window to draw the keywords to.

var _winX = argument0;
var _winY = argument1;
var _winW = argument2;
var _winH = argument3;

//Draw the black backdrop first.
draw_set_color(c_black);
draw_rectangle(_winX, _winY, _winX + _winW, _winY + _winH, false);


////Draw the keywords.
//var _i = 0;
//var _keyWordsGridHeight = ds_grid_height(knownKeyWords);
//var _string = "";
//draw_set_color(c_white);
//for (_i = 0; _i < _keyWordsGridHeight; _i++)
//{
//	_string = ds_grid_get(knownKeyWords, 0, _i);
//	draw_text(_winX + 24, _winY + 20 + ((string_height(_string) + 2) * _i), _string);
//}

//Draw the selected keyword.
var _topItem = selectedKeyWordIndex - displayedKeyWordIndex;
var _loop = min(maxDisplayedIndex + 1, ds_grid_height(knownKeyWords));
var _line = "";
var _prio = keyWordPriority.normal;
var _i = 0;
var _stringHeight = 0;

//If there's no further messages left in the queue, we can just draw the keywords and let the player
//ask about another topic
if (ds_queue_size(conversationQueue) == 0)
{
	repeat (_loop)
	{
		//Grab the data for the row.
		_line = ds_grid_get(knownKeyWords, 0, _topItem + _i);
		_prio = ds_grid_get(knownKeyWords, 1, _topItem + _i);
	
	
		//Define draw color.
		if (_prio == keyWordPriority.favorite)
		{
			draw_set_color(c_green);
		}
		else if (_prio == keyWordPriority.temporary)
		{
			draw_set_color(c_blue);
		}
		else
		{
			draw_set_color(c_white);
		}
	
		//Draw the text.
		draw_text(_winX + 40, _winY + 20 + _stringHeight, _line);
	
		//Draw the yellow border over if its the selected word.
		if (_i == displayedKeyWordIndex)
		{
			draw_set_color(c_yellow);
			draw_rectangle(_winX + 40, _winY + 20 + _stringHeight, _winX + _winW - 30, _winY + 20 + _stringHeight + string_height(_line), true);
			//draw_rectangle(_winX + 40, _winY +  20 + _stringHeight, _winX + 1 + _winW, _winY + 1 + _stringHeight + string_height(_line), true);
			draw_set_color(c_white);
		}
	
		_stringHeight += string_height(_line);
		_i++;
	
	}
}

//If there's still messages in the queue, the player can only choose "continue", to read the next message.
else
{
	draw_set_color(c_white);
	draw_text(_winX + 40, _winY + 20, "continue");
	draw_set_color(c_yellow);
	draw_rectangle(_winX + 40, _winY + 20, _winX + _winW - 30, _winY + 20 + string_height("continue"), true);
}

//Draw the window frame over it.
mDrawWindow(_winX, _winY, _winW, _winH, false);