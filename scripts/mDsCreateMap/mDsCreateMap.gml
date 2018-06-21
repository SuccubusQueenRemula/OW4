///@description In an effort to prevent ever having to worry about memory leaks with data structures, methods like this give a ds to an object in such a way that it is forever trackable and we can ensure it is destroyed when no longer needed. Return the list when done.
///@arg instID - the instance to do this for
///@arg name - the name of the mao (which variable will it be assigned to.)

var _id = argument0;
var _name = argument1;

if (instance_exists(_id))
{
	//First, we must ensure this object is a DS owner. If it already is, this will be a bit needlessly slow of a check,
	//but it's a necessary evil.
	mDsOwnerConceive(_id);

	//Add a row to the newly created grid.
	mDsGridAddRow(masterDsGrid);
	var _lastEntry = ds_grid_height(masterDsGrid) - 1;
	

	//Now we make the map and set it as a variable in the instance desired.
	var _map = ds_map_create();
	variable_instance_set(_id, _name, _map);
	
	//We remember the DS's type, name, and id number.
	ds_grid_set(masterDsGrid, MasterDsGridColumns.Type, _lastEntry, ds_type_map);
	ds_grid_set(masterDsGrid, MasterDsGridColumns.Name, _lastEntry, _name);
	ds_grid_set(masterDsGrid, MasterDsGridColumns.Number, _lastEntry, _map);
}