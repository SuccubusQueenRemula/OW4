if (ds_exists(mouseOverText, ds_type_list))
{
	if (!persistent)
	{
		ds_list_destroy(mouseOverText);
	}
}