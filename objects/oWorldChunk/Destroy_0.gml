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

instance_destroy(rightBorder);
instance_destroy(leftBorder);
instance_destroy(topBorder);
instance_destroy(bottomBorder);

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
