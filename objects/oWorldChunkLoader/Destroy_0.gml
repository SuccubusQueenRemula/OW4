event_inherited();
haltLoad = true;

if (!finishedLoading)
{
	instance_destroy(loadingWorldChunk);
}

if (ds_exists(chunkInfo, ds_type_map))
{
	ds_map_destroy(chunkInfo);
}

if (buffer_exists(dataBuffer))
{
	var _cleaner = instance_create_depth(0, 0, Depths.LogicItems, oAsyncLoadBufferCleaner);
	var _b = dataBuffer;
	
	with (_cleaner)
	{
		alarm[0] = 3;
		dataBuffer =  _b;
	}
}