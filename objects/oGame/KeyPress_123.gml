///@description Console commands
if (!isRelease && gameState != gameStates.consoleOpen)
{
	global.gamePaused = true;
	instance_create_depth(x, y,	Depths.LogicItems, oCommandConsole);
}