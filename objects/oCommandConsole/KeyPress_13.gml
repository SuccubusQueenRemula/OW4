global.gamePaused = false;
oGame.gameState = gameStates.normal;

var _str = kb.keyboardString;
var _list = ds_list_create();
mStringSplit(_str, " ", _list);


mConsoleCommandParse(_list);

if (returnMessage != "")
{
	ds_queue_enqueue(oErrorMessageDisplay.errorMessageQueue, returnMessage);
}

//Let's keep our memory clear.
ds_list_destroy(_list);
instance_destroy(kb);
instance_destroy();
