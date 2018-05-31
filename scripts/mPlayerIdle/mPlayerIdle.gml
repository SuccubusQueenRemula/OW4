///@description Handles oPlayer-specific idling code before running generic oActor code.

#region LeftClick
//World interaction. This can result in various things based on state.
if (oInputHandler.inputLeftClick)
{
	mPlayerIdleStateLeftClick();
}
#endregion LeftClick