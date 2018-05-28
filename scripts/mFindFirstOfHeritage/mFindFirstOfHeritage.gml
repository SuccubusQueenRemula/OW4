/// @description FindFirstInstanceOfHeritage(findX, findY, parentObject)
/// @description Finds the first instance at a point which is a descendant of the listed object.
/// @arg findX - The x coordinate to check.
/// @arg findY - The y coordinate to check.
/// @arg parentObject - The object type to find a descendant of.

var _findX = argument0;
var _findY = argument1;
var _parent = argument2;
var _nextInstance = noone;
var _deactivatedInstances = ds_list_create();
var _reactivatedInstance = 0


//Now we start sorting through ALL of the instances at this spot, so if there's still any to be had...
while (!position_empty(_findX, _findY))
{
	
	//First, we pull the topmost instance at this spot.
	_nextInstance = instance_position(_findX, _findY, all);
	//Is it the kind we're looking for?
	
	if (object_is_ancestor(_nextInstance.object_index, _parent) || _nextInstance.object_index == _parent)
	{
		//It is? Cool, let's fix up all the damage we did in the following else and return this instance.
		for (_reactivatedInstance = 0; _reactivatedInstance < ds_list_size(_deactivatedInstances); _reactivatedInstance++)
		{
			instance_activate_object(ds_list_find_value(_deactivatedInstances, _reactivatedInstance));
		}
		ds_list_destroy(_deactivatedInstances);
		return _nextInstance;
	}
	else
	{
		//This isn't an instance of the type we want. Let's store it in a list and deactivate it so we don't pull it again.
		ds_list_add(_deactivatedInstances, _nextInstance);
		instance_deactivate_object(_nextInstance);
	}
}

//If you got here, then you didn't find an instance of that type. Reactive them all and return noone.
for (_reactivatedInstance = 0; _reactivatedInstance < ds_list_size(_deactivatedInstances); _reactivatedInstance++)
{
	instance_activate_object(ds_list_find_value(_deactivatedInstances, _reactivatedInstance));
}
ds_list_destroy(_deactivatedInstances);

return noone;