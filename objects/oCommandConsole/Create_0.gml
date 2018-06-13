event_inherited();

kb = instance_create_depth(x, y, Depths.LogicItems, oVirtualKeyboard);
oGame.gameState = gameStates.consoleOpen;
returnMessage = "";
consoleFailure = false;