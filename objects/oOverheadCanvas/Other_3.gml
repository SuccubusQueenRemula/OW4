if (surface_exists(surface))
{
	surface_free(surface);
}
draw = false;


if (ds_exists(overheadWalls, ds_type_grid))
{
	ds_grid_destroy(overheadWalls);
}

if (ds_exists(overheadRoofs, ds_type_grid))
{
	ds_grid_destroy(overheadRoofs);
}

if (ds_exists(overheadDecorum, ds_type_grid))
{
	ds_grid_destroy(overheadDecorum);
}