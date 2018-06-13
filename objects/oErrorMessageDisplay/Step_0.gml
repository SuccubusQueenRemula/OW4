if (ds_queue_size(errorMessageQueue) != 0)
{
	if (displayedErrors[0] == "")
	{
		displayedErrors[0] = ds_queue_dequeue(errorMessageQueue);
		alarm[0] =  300;
	}
	else if (displayedErrors[1] == "")
	{
		displayedErrors[1] = ds_queue_dequeue(errorMessageQueue);
		alarm[1] =  300;
	}
	else if (displayedErrors[2] == "")
	{
		displayedErrors[2] = ds_queue_dequeue(errorMessageQueue);
		alarm[1] =  300;
	}
}