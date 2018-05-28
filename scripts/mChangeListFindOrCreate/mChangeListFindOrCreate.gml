///@description - Given a potential changelist name, either finds the existing changelist or (if it doesn't exist) makes one of that name. Returns the changelist.
///@arg chunkX - The x coordinate of the chunk you seek the CL of.
///@arg chunkY - The y coordinate of the chunk you seek the CL of.

//Concatenate the changelist name using the x and y.
var _key = "X" + string(argument0) + "Y" + string(argument1) + CHUNK_FILE_EXT;


with (oChangeListHandler)
{
	//Grab the changelist out of the collection using the key.
	var _value = ds_map_find_value(changeLists, _key);
	
	//This changelist didn't exist? We make it first.
	if (is_undefined(_value))
	{
		//If value is undefined, then this changelist does not currently exist in memory.
		//Thus, we need to make a changelist, and set it as the value here.
		_value = mCreateChangeList(argument0, argument1);
		
		ds_map_set(changeLists, _key, _value);		
		return _value;
	}
	
	//This changelist existed. Grab the ID number and activate it.
	else
	{
		instance_activate_object(_value);
		return _value;
	}
}

//Not sure how you'd hit this.
return noone;