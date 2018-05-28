if (!finishedLoading)
{
	instance_destroy(loadingWorldChunk);
}

if (ds_exists(chunkInfo, ds_type_map))
{
	ds_map_destroy(chunkInfo);
}