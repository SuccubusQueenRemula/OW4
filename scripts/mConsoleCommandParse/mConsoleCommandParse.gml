///@description Given a list of the individual words in a console command, determines appropriate behavior.
///@arg wordList - The list of words, delimited by spaces, in the console command.

//This is the list of all words typed into the console, already separated by spaces.
var _list = argument0;

#region FailureIfNotGivenList
if (!ds_exists(_list, ds_type_list))
{
	returnMessage = "CONSOLE ERROR: Console command words not given as a list.";
	consoleFailure = true;
	return;
}
#endregion


#region FailureIfListIsEmpty
else if (!ds_list_size(_list) > 0)
{
	returnMessage = "CONSOLE ERROR: Console command had no words given.";
	consoleFailure = true;
	return;
}
#endregion


//Grab the first word.
var _firstWord = ds_list_find_value(_list, 0);

switch (_firstWord)
{
	case "tpc":
		#region TeleportChunk
		//This should take only 2 arguments. Mark a failure otherwise.
		if (ds_list_size(_list) != 3)
		{
			returnMessage = "CONSOLE ERROR: tpc command requires exactly 2 arguments.";
			consoleFailure = true;
			break;
		}
		else
		{
			//Grab the 2 args, with all non-numeric characters removed.
			var _xCoord = string_digits(ds_list_find_value(_list, 1));
			var _yCoord = string_digits(ds_list_find_value(_list, 2));
			
			//If either arg isn't a number, mark a failure.
			if (_xCoord == "" || _yCoord == "")
			{
				returnMessage = "CONSOLE ERROR: tpc command requires two numeric arguments.";
				consoleFailure = true;
				break;
			}
			else
			{
				_xCoord = real(_xCoord);
				_yCoord = real(_yCoord);
				mObliterateWorld();
				mLoadWorldAtCenterChunk(_xCoord, _yCoord);
			}
			
		}
		#endregion
		break;
		
	case "tpl":
		if (ds_list_size(_list) != 3)
		{
			returnMessage = "CONSOLE ERROR: tpl command requires exactly 2 arguments.";
			consoleFailure = true;
			break;
		}
		else
		{
			//Grab the 2 args, with all non-numeric characters removed.
			var _xCoord = string_digits(ds_list_find_value(_list, 1));
			var _yCoord = string_digits(ds_list_find_value(_list, 2));
			
			//If either arg isn't a number, mark a failure.
			if (_xCoord == "" || _yCoord == "")
			{
				returnMessage = "CONSOLE ERROR: tpl command requires two numeric arguments.";
				consoleFailure = true;
				break;
			}
			else
			{
				_xCoord = real(_xCoord);
				_yCoord = real(_yCoord);
				
				_xCoord = clamp(_xCoord, 0, global.chunkWidth);
				_yCoord = clamp(_yCoord, 0, global.chunkHeight);
				
				var _centerChunk = ds_grid_get(oWorldHandler.worldChunks, 1, 1);
				
				//var _px; //= oPlayer.x;
				//var _py;//= oPlayer.y;
				
				var _cx = _centerChunk.x + _xCoord;
				var _cy = _centerChunk.y + _yCoord;
				
				var _xDiff = _cx - oPlayer.x;
				var _yDiff = _cy - oPlayer.y;
				
				with (all)
				{
					if (object_index != oPlayer && object_index != oScrollBox)
					{
						x -= _xDiff;
						y -= _yDiff;
					}
			    }
			}	
		}
		break;
	
	default:
		returnMessage = "CONSOLE ERROR: First word of given command not recognized.";
		consoleFailure = true;
		break;
}