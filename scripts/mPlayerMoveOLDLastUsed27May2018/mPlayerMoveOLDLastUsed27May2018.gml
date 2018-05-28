//Determine the total sum of cardinal direction input.
var _xMove = oInputHandler.inputRight - oInputHandler.inputLeft;
var _yMove = oInputHandler.inputDown - oInputHandler.inputUp;

//If the player leaves the scrollbox centered on the room, the world starts moving on that
//axis instead of the player.
var _scrollBox = instance_find(oScrollBox, 0);
//var _scrollWorldX = 0;
//var _scrollWorldY = 0;
var _playerID = id;

//If the player is not actually moving, we just go ahead and set player state to idle, then exit this script.

if (_xMove == 0 && _yMove == 0)
{
	playerState = playerStates.idle;
	exit;
}

#region Debug
if (keyboard_check_released(ord("X")))
{
	var _centerChunk = ds_grid_get(oWorldHandler.worldChunks, 1, 1);
	x = _centerChunk.x + global.chunkWidth - 1;
	y = _centerChunk.y;
}

else if (keyboard_check_released(ord("Z")))
{
	x += 1;
	y -= 1;
}
#endregion Debug



#region InfiniteWorld
if (_scrollBox != noone)
{
	mPlayerInfiniteWorldMove(_xMove, _yMove, _scrollBox, _playerID);
}
#endregion InfiniteWorld

#region LimitedWorld
else
{
	//-----X AXIS MOVEMENT-----
	if (_xMove != 0)
	{
		//Determine how much an xMove is and add that to our X.
		var _xTotalMove = _xMove * moveSpeed;
		x += _xTotalMove;
	
		//Are we colliding?
		if (place_meeting(x, y, oSolid) || place_meeting(x, y, oDrawableSolid))
		{
			//If so, back up until we're not.
			while(place_meeting(x, y, oSolid) || place_meeting(x, y, oDrawableSolid))
			{
				x -= _xMove;
			}
		}
	}
	
	//-----Y AXIS MOVEMENT-----
	if (_yMove != 0)
	{
		//Determine how much a yMove is and add it to your Y
		var _yTotalMove = _yMove * moveSpeed;
		y += _yTotalMove;
		//Are we colliding?
		if (place_meeting(x, y + _yTotalMove, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid))
		{
			//If so, back up until we're not.
			while(place_meeting(x, y, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid))
			{
				y -= _yMove;
			}
		}
	}
}

#endregion LimitedWorld





#region DetermineFaceDirection
//We want to see if we even have a need to change what way we're facing.
//To do this, we check what the face direction was last frame.
//If it still applies, we ignore other potential inputs and keep it.

//This stores whether or not we'll need a new sprite.
var _newFaceDirection = mIsMovingLastFrameFaceDir(_xMove, _yMove);


//So we only need to change to a new faceDirection under these criteria.
//1. The player must have hit a direction. If they're just idling, FD should stay the same.
//2. The player must NOT be hitting a direction matching current FD.

if ((_xMove != 0 || _yMove != 0) && _newFaceDirection)
{
	
	//We assign by y first.
	if (_yMove == 1)
	{
		faceDirection = faceDirections.down;
	}
	else if (_yMove == - 1)
	{
		faceDirection = faceDirections.up;
	}
	else if (_xMove == 1)
	{
		faceDirection = faceDirections.right;
	}
	else if (_xMove == -1)
	{
		faceDirection = faceDirections.left;
	}
}
#endregion DetermineFaceDirection

#region AttemptConversation
//So 
#endregion AttemptConversation

