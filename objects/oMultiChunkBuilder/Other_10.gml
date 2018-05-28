/// @description Progress Room

//We haven't started yet. We need to make the current room the first room.
if (currentRoom == -1)
{
	currentRoom = room_first;
	
	//Now we get the name of the current room.
	var _roomName = room_get_name(currentRoom);
	var _firstChar = string_char_at(_roomName, 1);
	
	//This is a chunk creator room. Let's go to it. 
	//The chunk saver in that room will recall this event this when it's done saving.
	if (_firstChar == "c")
	{
		room_goto(currentRoom);
		exit;
	}
}

//Was the last room we checked the last room??
if (currentRoom == room_last)
{
	//Then we need to close.
	game_end();
}

//Was the first room already checked? Did it not start with a C??
//Either way, time to move on checking more rooms.

var _keepSearching = true;

while (_keepSearching)
{
	currentRoom = room_next(currentRoom);
	
	var _roomName = room_get_name(currentRoom);
	var _firstChar = string_char_at(_roomName, 1);
	
	//This is a chunk creator room. Let's go to it. 
	//The chunk saver in that room will recall this event this when it's done saving.
	if (_firstChar == "c")
	{
		room_goto(currentRoom);
		exit;
	}
	
	//Wasn't a chunk room. Was it the last room?
	if (currentRoom == room_last)
	{
		//It was? Then we've checked every room. Close the game.
		game_end(); 
	}
}