if (ds_exists(errorMessageQueue, ds_type_queue))
{
	ds_queue_destroy(errorMessageQueue);
}