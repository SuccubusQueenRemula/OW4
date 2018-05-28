event_inherited();

mDefineGlobals();
//mFullscreen();

enum gameStates
{
	normal,
	conversation,
	pooping,
	eatingPoop
}

gameState = gameStates.normal;
gamePaused = false;
pausedSprite = noone;

var _viewW = camera_get_view_width(view_camera[0]);
var _viewH = camera_get_view_height(view_camera[0]);
//display_set_gui_size(_viewW, _viewH);
pausedSpriteScale = display_get_gui_width()/view_wport[0];


//Create other singletons
mCreateSingleton(oConversationHandler);
mCreateSingleton(oInputHandler);
mCreateSingleton(oMasterDraw);
mCreateSingleton(oChangeListHandler);
mCreateSingleton(oTimer);
if (true)
{
	mCreateSingleton(oCamera);
}
mDeleteDuplicateSingletons();

