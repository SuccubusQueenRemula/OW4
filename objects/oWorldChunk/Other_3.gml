if (ds_exists(instanceList, ds_type_list))
{
	ds_list_destroy(instanceList);
}

if (ds_exists(tileGrid, ds_type_grid))
{
	ds_grid_destroy(tileGrid);
}

if (ds_exists(instanceMap, ds_type_map))
{
	ds_map_destroy(instanceMap);
}

if (ds_exists(terrainWalls, ds_type_grid))
{
	ds_grid_destroy(terrainWalls);
}

if (surface_exists(terrainSurface))
{
	surface_free(terrainSurface);
}
