///@description Deletes all change lists.

with (oChangeList)
{
	instance_activate_object(id);
	instance_destroy();
}

with (oChangeListHandler)
{
	ds_map_clear(changeLists);
}