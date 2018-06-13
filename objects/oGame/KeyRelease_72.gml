if (!isRelease && gameState != gameStates.consoleOpen)
{

	global.debugMode = !global.debugMode;

	with (oSolid)
	{
		visible = global.debugMode;
	}

}