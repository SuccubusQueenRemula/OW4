///@description Determine whether to close this or not based on if this is a full world build.
if (instance_exists(oMultiChunkBuilder))
{
	with (oMultiChunkBuilder)
	{
		//Call the code to begin the next room.
		event_user(0);
	}
}
else
{
	var _test = 0;
	game_end();
}