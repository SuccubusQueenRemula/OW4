///@description Returns true if a given object is a descendant or the same type as another. Otherwise returns false.
///@arg child - The child object.
///@arg parent - The parent object.

var _child = argument0;
var _parent = argument1;


if (_child == _parent || object_is_ancestor(_child, _parent))
{
	return true;
}

return false;