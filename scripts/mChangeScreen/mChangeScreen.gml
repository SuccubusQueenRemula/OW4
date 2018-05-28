///@description The basic functionality to change screen from one player-controlled room to another.
///@arg player - ID of the player instance.
///@arg arrivalRoom - The room index of the room to arrive at.
///@arg arrivalX - The x coordinate for the player to arrive at.
///@arg arrivalY - The y coordinate for the player to arrive at.

var _player = argument0;
var _room = argument1;
var _arrivalX = argument2;
var _arrivalY = argument3;

if (_room != noone)
{
	with (_player)
	{
		x = _arrivalX;
		y = _arrivalY;
		persistent = true;
		mPreserveSingletons();
		room_goto(_room);
	}
}