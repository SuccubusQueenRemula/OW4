///@arg boolPausing

var _pausing = argument0;

if (_pausing)
{
	image_speed = 0;
}

else if (!_pausing)
{
	image_speed = baseImageSpeed;
	with (oPlayer)
	{
		playerState = playerStates.move;
	}
}