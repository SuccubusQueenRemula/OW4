///@description Destroy all data structures.

if (ds_exists(knownKeyWords, ds_type_list))
{
	ds_list_destroy(knownKeyWords);
}

if (ds_exists(favoriteKeyWords, ds_type_list))
{
	ds_list_destroy(favoriteKeyWords);
}