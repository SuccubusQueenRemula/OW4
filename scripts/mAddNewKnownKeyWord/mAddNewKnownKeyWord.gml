///@arg newKeyWord
///@arg newWordPriority

var _newKeyWord = argument0;
var _newWordPriority = argument1;
var _alreadyExists = false;
var _i = 0;

//Techically, this can be called from anywhere, but it must ALWAYS be oConversationHandler which runs the code.
//Only this object has the list of all known keywords.
with (oConversationHandler)
{
	//Does the player already know this keyword? Search existing keywords and record if so.
	repeat (ds_grid_height(knownKeyWords))
	{
		if (ds_grid_get(knownKeyWords, 0, _i) == _newKeyWord) 
		{
			_alreadyExists = true;
			break;
		}
		_i++;
	}
	
	//The player didn't already know this word. Let's add it.
	if (!_alreadyExists)
	{
		//Remember what keyword is currently selected, so we can keep it selected when the index potentially changes after a new word's added.
		var _selectedWord = noone;
		_selectedWord = ds_grid_get(knownKeyWords, 0, selectedKeyWordIndex);
		if (!is_string(_selectedWord))
		{
			_selectedWord = "NOT_VALID_DATA";
		}
		//The new height of the word grid is just going to be the current height plus one extra row.
		var _newHeight = ds_grid_height(knownKeyWords) + 1;
		ds_grid_resize(knownKeyWords, 2, _newHeight);
		//Now we add the word to the new bottom row.
		ds_grid_add(knownKeyWords, 0, _newHeight - 1, _newKeyWord);
		ds_grid_add(knownKeyWords, 1, _newHeight - 1, _newWordPriority);
		
		//The sort is a bit of a mess now, but it works. It also might be called from multiple places later.
		//So for now it's just in its own method.
		mSortKnownKeyWords();
		
		//TODO: This doesn't work at all. Currently a word added above the selected word pushes the selected word below the cursor.
		//Now that the keywords are sorted, we can find our selected keyword by text and reselect that as the active index.
		for (_i = 0; _i < _newHeight; _i++)
		{
			var _iWord = ds_grid_get(knownKeyWords, 0, _i);
			if (_iWord == _selectedWord)
			{
				//var _difference = abs(_i - selectedKeyWordIndex);
				//selectedKeyWordIndex = _i;
				//displayedKeyWordIndex = min(displayedKeyWordIndex - _difference, 0);
			}
		}
	}
}