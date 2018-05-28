///@description Compares an actor's face direction last frame against what ways they are moving this frame to determine a face direction.
///@arg xMove - 1, 0, or -1 to determine which way the actor is moving on the x-axis.
///@arg yMove - 1, 0, or -1 to determine which way the actor is moving on the y-axis.


//We want to see if we even have a need to change what way the actor is facing.
//To do this, we check what the face direction was last frame.
//If they're still moving on that axis, we ignore other directions moved and keep them facing them same way.
//This stops the actor from jittering face directions and gives no direction priority over another.


var _xMove = argument0;
var _yMove = argument1;

//This stores whether or not we'll need a new sprite.
var _newFaceDirection = mIsMovingLastFrameFaceDir(_xMove, _yMove);


//So we only need to change to a new faceDirection under these criteria.
//1. The actor must be moving. If they're just idling, FD should stay the same.
//2. The actor must NOT be moving a direction matching current FD.

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

