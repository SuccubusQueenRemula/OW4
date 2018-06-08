if (ds_exists(instanceList, ds_type_list))
{
	ds_list_destroy(instanceList);
}

if (ds_exists(tileGrid, ds_type_grid))
{
	ds_grid_destroy(tileGrid);
}

if (ds_exists(terrainWalls, ds_type_grid))
{
	ds_grid_destroy(terrainWalls);
}

if (ds_exists(instanceMap, ds_type_map))
{
	ds_map_destroy(instanceMap);
}

//Destroy any devices that had this chunk assigned as the parent.
var _chunk = id;
with (oDevice)
{
	if (parentChunk == _chunk)
	{
		instance_destroy();
	}
}

if (surface_exists(terrainSurface))
{
	surface_free(terrainSurface);
}


instance_destroy(overheadCanvas);