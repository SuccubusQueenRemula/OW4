//If the inventory has been populated as a list, destroy it to free up memory.
if (variable_instance_exists(id, "actorInventory"))
{
	if (ds_exists(actorInventory, ds_type_list))
	{
		ds_list_destroy(actorInventory);
	}
}