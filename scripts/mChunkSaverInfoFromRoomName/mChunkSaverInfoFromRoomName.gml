///@description To be called by oWorldChunkSaver. Extracts info from the name of the current room and applies to the map accordingly.

//Get the X and Y of the chunk from the room name.
var _roomName = room_get_name(room);
var _roomProps = ds_list_create();
mStringSplit(_roomName, "_", _roomProps);
var _XAndY = ds_list_find_value(_roomProps, 0);
var _chunkName = ds_list_find_value(_roomProps, 1);
ds_list_destroy(_roomProps);

var _onX = true;

for (var _i = 0; _i < string_length(_XAndY); _i++)
{
	var _char = string_char_at(_XAndY, _i + 1);
	if (_char == "X" || _char == "c" || _char == "x")
	{
		continue;
	}
	else if (_char == "Y" || _char == "y")
	{
		_onX = false;
		continue;
	}
	else
	{
		if (_onX)
		{
			chunkX += _char;
		}
		else
		{
			chunkY += _char;
		}
	}
}


 
//Save the map as a json string, then save it to a file.
ds_map_add(chunkInfo, "chunkName", _chunkName);