///@description Adds a row to a ds_grid.
///@arg grid - The grid to add a row to.

if (ds_exists(argument0, ds_type_grid))
{
	ds_grid_resize(argument0, ds_grid_width(argument0), ds_grid_height(argument0) + 1);
}