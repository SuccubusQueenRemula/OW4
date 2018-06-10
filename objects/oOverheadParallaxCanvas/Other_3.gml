if (ds_exists(parallaxGrid, ds_type_grid))
{
	ds_grid_destroy(parallaxGrid);
}

if (surface_exists(surface))
{
	surface_free(surface);
	draw = false;
}