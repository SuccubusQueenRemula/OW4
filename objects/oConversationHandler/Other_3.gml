///@description Destroy all data structures.

if (ds_exists(knownKeyWords, ds_type_grid))
{
	ds_grid_destroy(knownKeyWords);
}

if (ds_exists(conversationQueue, ds_type_queue))
{
	ds_list_destroy(conversationQueue);
}