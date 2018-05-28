///@arg newState The state to change the player to.

var _newState = argument0;
frameCounter = -1;
switch (_newState)
{
	case playerStates.move:
		image_index = 0;
		image_speed = 1;
		if (faceDirection == faceDirections.left) {image_xscale = -1;}
		else {image_xscale = 1;}
		playerState = playerStates.move;
		break;
	
	case playerStates.attack:
		image_index = 0;
		image_speed = 1;
		image_xscale = 1;
		playerState = playerStates.attack;
		break;

	default:
		break;
}