///@description Usually called by oGame. Creates an object instance, but only if that object doesn't exist already.
///@arg objectIndex - The type of object to create as a singleton.

var _objectIndex = argument0;

if (!instance_exists(_objectIndex))
{
	return instance_create_layer(-1, -1, "Instances", _objectIndex);
}

return noone;

