///@description Attempts to make an item into the item held by the mouse. If this fails for any reason, the item remains on the ground and the function returns false. Else, it returns true.
///@arg item - The item being picked up by the player

var _item = argument0;

var _px = oPlayer.x
var _py = oPlayer.y
var _ix = _item.x;
var _iy = _item.y;

//An item can only be attached to the mouse if no item is currently held there... for now, anyways.
if (global.mouseItem == noone)
{
	var _distance = point_distance(_px, _py, _ix, _iy);
	
	if (_distance < 300)
	{
		global.mouseItem = _item;
		_item.isMouseAttached = true;
		return true;
	}
}

return false;