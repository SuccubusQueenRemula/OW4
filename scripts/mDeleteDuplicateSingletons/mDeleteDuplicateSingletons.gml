///@description Causes each type of singleton to remove duplicates. Be warned there is absolutely no preference as to which lives and dies.

//We'll be checking every other instance of this type, so we need to remember the id of what we're working with.
var _workingID = noone;

with (oSingleton)
{
	//First, what if originality is undefined? 
	//There's likely already a singleton of this type that exists.
	//So we'll set this to true, check every other one, then set to false if a true exists, yielding.
	if (!variable_instance_exists(id, "isOriginal"))
	{
		isOriginal = true;
		_workingID = id;
		
		with (object_index)
		{
			if (_workingID != id)
			{
				if (variable_instance_exists(id, "isOriginal"))
				{
					if (isOriginal) { _workingID.isOriginal = false; }
				}
			}
		}
	}
	
	//If it's defined already OR we're just still true from the chunk above, we set all others of this type to false.
	//Thus, there will be only one true of each kind.
	if (isOriginal)
	{
		_workingID = id;
		with (object_index)
		{
			isOriginal = (_workingID == id);
		}
	}
	
	//Remove all the falses.
	else
	{
		instance_destroy();
	}
}