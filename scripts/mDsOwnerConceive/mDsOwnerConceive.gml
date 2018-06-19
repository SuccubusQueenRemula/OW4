///@description No object can have a DS with the DS helper scripts unless it has been conceived as a DS owner.
///@arg instID - which instance this is for.

//All you need to be a DS owner is a masterDsList. If you have it, we do nothing. If you don't, we make it.
if (!variable_instance_exists(argument0, "masterDsGrid"))
{
	masterDsGrid = ds_grid_create(3, 0);
}


