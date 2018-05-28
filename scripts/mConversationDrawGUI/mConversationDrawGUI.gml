///@arg selectedIndex

if (oGame.gameState == gameStates.conversation)
{
	//If the player has only just started talking to this NPC, we force dequeue the initial message here.
	if (displayedText == "INITIALIZE" || displayedPortrait == "INITIALIZE")
	{
		currentMessage = ds_queue_dequeue(conversationQueue);
		displayedText = currentMessage.messageText;
		displayedPortrait = currentMessage.portraitSprite;
		
	}
	
	//Store the sprite sizes.
	var _cornerWidth = sprite_get_width(sPortraitFrameUpRight);
	var _cornerHeight = sprite_get_height(sPortraitFrameUpRight);
	var _portraitWidth = sprite_get_width(sPortraitBack);
	//Store the Y (which all windows share here) and the X of the portrait window.
	var _portraitX = 5;
	var _portraitY = display_get_gui_height() - 10 - sprite_get_height(sPortraitBack);
	
	
	mDrawPortraitWindow(displayedPortrait);
	var _textBoxX = _portraitX + _portraitWidth + 20;
	var _textBoxY = _portraitY;
	var _textBoxWidth = 500;
	var _textBoxHeight = sprite_get_height(sPortraitBack);
	
	
	mDrawWindow(_textBoxX, _textBoxY, _textBoxWidth, _textBoxHeight, true);
	var _keyWordsX = _textBoxX + _textBoxWidth + 10;
	var _keyWordsY = _textBoxY;
	//mDrawWindow(_keyWordsX, _keyWordsY, 250, _textBoxHeight, true);
	
	draw_set_color(c_white);
	draw_text_ext(_textBoxX + 24, _textBoxY + 20, displayedText, 1, _textBoxWidth - 48);
	mDrawKeyWordsWindow(_keyWordsX, _keyWordsY, 170, _textBoxHeight);
	//var _queueSize = ds_queue_size(conversationQueue);
}

//if (oGame.gameState == gameStates.conversation)
//{
//	//First, we get the total GUI width.
//	var _guiWidth = display_get_gui_width();
//	//The left 24% of the screen is reserved for the portrait of the speaker
//	var _portraitSpace = round(_guiWidth * .23);
//	//The middle 59% is reserved for the speaker's text.
//	var _speakerTextSpace = round(_guiWidth * .59);
//	//The right 14% of the screen is reserved for the list of keywords.
//	var _keyWordSpace = round(_guiWidth * .13);
//	//Also we remember the size of the 1% gaps.
//	var _gapSize = round(_guiWidth * .01);
//	//The boxes will all only be 25% of the height of the GUI.
//	var _guiHeight = display_get_gui_height();
//	var _boxHeight = round(_guiHeight * .25);
//	//We don't actually care about the height of the box, just where the top should be.
//	var _boxTop = _guiHeight - _boxHeight - _gapSize;
//	var _boxBottom = _guiHeight - _gapSize;
	
	
	
//	//Prep a 50% transparent black.
//	draw_set_color(c_black);
//	draw_set_alpha(.5);
	
//	//First, we draw the portrait on the left.
//	draw_rectangle(_gapSize, _boxTop, _gapSize + _portraitSpace, _boxBottom, false);
	
//	//Now we draw the space for text.
//	var _textBoxLeft = _gapSize + _portraitSpace + _gapSize;
//	draw_rectangle(_textBoxLeft, _boxTop, _textBoxLeft + _speakerTextSpace, _boxBottom, false);
	
//	//And finally, we draw the space for keywords.
//	var _keyBoxLeft = _textBoxLeft + _speakerTextSpace + _gapSize;
//	draw_rectangle(_keyBoxLeft, _boxTop, _keyBoxLeft + _keyWordSpace, _boxBottom, false);
	
	
//	draw_set_color(c_white);
//	draw_set_alpha(1);
	
//	//Now we write all of the player's known keywords.
//	with (oConversationHandler)
//	{
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_top);
//		draw_set_color(c_white);
//		draw_text(_textBoxLeft, _boxTop, displayedText);
//		draw_set_halign(fa_left);
//		draw_set_valign(fa_top);
//		var _i = 0;
//		var _stringHeight = 0;
//		var _line = "";
//		var _prio = keyWordPriority.normal;
		
//		var _topItem = selectedKeyWordIndex - displayedKeyWordIndex;
//		var _loop = min(maxDisplayedIndex + 1, ds_grid_height(knownKeyWords));
//		repeat(_loop)
//		{
//			_line = ds_grid_get(knownKeyWords, 0, _topItem + _i);
//			_prio = ds_grid_get(knownKeyWords, 1, _topItem + _i);
			
			
//			if (_prio == keyWordPriority.favorite) { draw_set_color(c_green); }
//			else if (_prio == keyWordPriority.temporary) { draw_set_color(c_blue); }
//			else { draw_set_color(c_white); }
			
//			draw_text(_keyBoxLeft + 1, _boxTop + 1 + _stringHeight, _line);
//			if (_i == displayedKeyWordIndex)
//			{
//				draw_set_color(c_yellow);
//				draw_rectangle(_keyBoxLeft + 1, _boxTop + 1 + _stringHeight, _keyBoxLeft + 1 + _keyWordSpace, _boxTop + 1 + _stringHeight + string_height(_line), true);
//				draw_set_color(c_white);
//			}
//			_stringHeight += string_height(_line);
//			_i++;
			
//		}
		
		
//		//repeat(ds_grid_height(knownKeyWords))
//		//{
//		//	_line = ds_grid_get(knownKeyWords, 0, _i);
//		//	_prio = ds_grid_get(knownKeyWords, 1, _i);
			
//		//	if (_prio == keyWordPriority.favorite) { draw_set_color(c_green); }
//		//	else { draw_set_color(c_white); }
			
//		//	draw_text(_keyBoxLeft + 1, _boxTop + 1 + _stringHeight, _line);
//		//	if (_i == selectedKeyWordIndex)
//		//	{
//		//		draw_set_color(c_yellow);
//		//		draw_rectangle(_keyBoxLeft + 1, _boxTop + 1 + _stringHeight, _keyBoxLeft + 1 + _keyWordSpace, _boxTop + 1 + _stringHeight + string_height(_line), true);
//		//		draw_set_color(c_white);
//		//	}
//		//	_stringHeight += string_height(_line);
//		//	_i++;
//		//}
//	}
	
//}