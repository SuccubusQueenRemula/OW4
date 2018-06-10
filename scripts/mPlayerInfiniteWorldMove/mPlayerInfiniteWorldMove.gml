///@description Handles the logic when attempting to move in a seamless area, such as the eponymous overworld.
///@arg xMove - The direction the player is moving on the x axis, 0 for no move, -1 for left, 1 for right.
///@arg yMove - The direction the player is moving on the y axis, 0 for no move, -1 for up, 1 fpr down.
///@arg scrollBox - The instance ID of the scrollbox which determines whether to move the player or world
///@arg playerID - The player's ID.

var _xMove = argument0;
var _yMove = argument1;
var _scrollBox = argument2;
var _playerID = argument3;


#region XMovement
if (_xMove != 0)
{
	var _xTotalMove = _xMove * moveSpeed;
	if ((_xMove == 1 && _scrollBox.x < x && !place_meeting(x, _scrollBox.y, _scrollBox)) 
	|| (_xMove == -1 && _scrollBox.x > x && !place_meeting(x, _scrollBox.y, _scrollBox)))
	{
		//We're not in the scrollbox, but if we'd collide, let's ignore that and just get
		//to the collision faster.
		if (place_meeting(x + _xTotalMove, y, oSolid) || place_meeting(x + _xTotalMove, y, oDrawableSolid))
		{
			while (!(place_meeting(x + _xTotalMove, y, oSolid) || place_meeting(x + _xTotalMove, y, oDrawableSolid)))
			{
				x += _xMove;
			}
		}
		//No collision? Move the world in the opposite direction.
		else
		{
			with (all)
			{
					if (id != _playerID && id != _scrollBox)
					{
						x -= _xTotalMove;
					}
			}
			global.worldChunkOffsetX -= _xTotalMove;
		}
	}
	else
	{
		if (place_meeting(x + _xTotalMove, y, oSolid) || place_meeting(x + _xTotalMove, y, oDrawableSolid))
		{
			while (!(place_meeting(x + _xTotalMove, y, oSolid) || place_meeting(x + _xTotalMove, y, oDrawableSolid)))
			{
				x += _xMove;
			}
		}
		else
		{
			x += _xTotalMove;
		}
	}
}
#endregion XMovement

#region YMovment
if (_yMove != 0)
{
	var _yTotalMove = _yMove * moveSpeed;
	
	if ((_yMove == 1 && _scrollBox.y < y && !place_meeting(_scrollBox.x, y, _scrollBox)) 
	|| (_yMove == -1 && _scrollBox.y > y && !place_meeting(_scrollBox.x, y, _scrollBox)))
	{
		//We're not in the scrollbox, but if we'd collide, let's ignore that and just get
		//to the collision faster.
		if (place_meeting(x, y + _yTotalMove, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid))
		{
			while (!(place_meeting(x, y+ _yTotalMove, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid)))
			{
				y += _yMove;
			}
		}
		else
		{
			with (all)
			{
				if (id != _playerID && id != _scrollBox)
				{
					y -= _yTotalMove;
				}
				
			}
			global.worldChunkOffsetY -= _yTotalMove;
		}
	}
	else
	{
		if (place_meeting(x, y + _yTotalMove, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid))
		{
			while (!(place_meeting(x, y+ _yTotalMove, oSolid) || place_meeting(x, y + _yTotalMove, oDrawableSolid)))
			{
				y += _yMove;
			}
		}
		else
		{
			y += _yTotalMove;
		}
	}
}
#endregion Y Movement