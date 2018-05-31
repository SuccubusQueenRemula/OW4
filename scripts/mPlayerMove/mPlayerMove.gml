///@description Handles oPlayer-specific movement code before running generic oActor code.


#region VariableAssignment

//The player object collects input from the input handler. This is unique behavior which other actors do not perform.
var _xMove = oInputHandler.inputRight - oInputHandler.inputLeft;
var _yMove = oInputHandler.inputDown - oInputHandler.inputUp;

//The scrollbox's existence must be proven. No scrollbox results in lots of danger.
var _scrollBox = instance_find(oScrollBox, 0);
//The player's id must be stored for when other instances take over here.
var _playerID = id;

#endregion VariableAssignment

#region DetectCollisionWithChunkBorder
var _unloadZone = mFindFirstOfHeritage(x, y, oWorldChunkBorder);
if (_unloadZone != noone)
{
	with (_unloadZone)
	{
		mUnloadChunkZone();
	}
}
#endregion DetectCollisionWithChunkBorder

#region Movement
//We only really care about handling movement here if there's actually movement to be had.
if (_xMove != 0 || _yMove != 0)
{
	//If the scrollbox exists, we are on the infinite overworld.
	if (_scrollBox != noone)
	{
		mPlayerInfiniteWorldMove(_xMove, _yMove, _scrollBox, _playerID);
	}
	
	//TODO: Do we want finite world movement? Will that tech ever matter.
}
//No movement? Flip state to idle and then run the idle code instead.
else
{
	playerState = playerStates.idle;
	mPlayerIdle();
	exit;
}
#endregion Movement

//Call generic actor code to update face dir.
mActorUpdateFaceDir(_xMove, _yMove);

//See if a conversation has been initiated this frame. If so, we can just exit.
if (mPlayerAttemptConversation()) { exit; }

#region LeftClick
//World interaction. This can result in various things based on state.
if (oInputHandler.inputLeftClick)
{
	mPlayerMoveStateLeftClick();
}
#endregion LeftClick

#region Inventory
if (oInputHandler.inputInventory)
{
	mAlternateInventoryDraw();
}
#endregion Inventory