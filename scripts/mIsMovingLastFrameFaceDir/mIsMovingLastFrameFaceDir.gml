///@description To be run by actors. Returns true if the actor is moving the same direction they were last frame. For example, if the actor was facing left last frame, returns true if their xMove is -1 this frame.
///@arg xMove - 1, 0, or -1 to determine which way the actor is moving on the x-axis.
///@arg yMove - 1, 0, or -1 to determine which way the actor is moving on the y-axis.

var _xMove = argument0;
var _yMove = argument1;


var _newFaceDirection;

switch (faceDirection)
{
	case faceDirections.down:
		_newFaceDirection = !(_yMove == 1);
		break;
		
	case faceDirections.up:
		_newFaceDirection = !(_yMove == -1);
		break;
		
	case faceDirections.left:
		_newFaceDirection = !(_xMove == -1);
		break;
		
	case faceDirections.right:
		_newFaceDirection = !(_xMove == 1);
		break;
}

return _newFaceDirection;