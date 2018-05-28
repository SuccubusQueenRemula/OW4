if (ds_exists(depthGrid, ds_type_grid))
{
	ds_grid_destroy(depthGrid);
	depthGrid = noone;
}
