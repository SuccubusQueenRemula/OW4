///@description Handles oPlayer-specific idling code before running generic oActor code.


var _xMove = oInputHandler.inputRight - oInputHandler.inputLeft;
var _yMove = oInputHandler.inputDown - oInputHandler.inputUp;


//If move input is detected, we change state, run the move code, then exit this event without checking for other move states.
if (_xMove != 0 || _yMove != 0)
{
	playerState = playerStates.move;
	mPlayerMove();
	exit;
}

//World interaction. This can result in various things based on state.
#region LeftClick

if (oInputHandler.inputLeftClick)
{
	mPlayerIdleStateLeftClick();
}


#endregion LeftClick