if (variable_instance_exists(id, "conversation"))
{
	if (ds_exists(conversation, ds_type_map))
	{
		ds_map_destroy(conversation);
	}
}