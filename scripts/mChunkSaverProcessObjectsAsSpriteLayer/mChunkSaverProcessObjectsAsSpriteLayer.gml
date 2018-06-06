///@description To be called by oWorldChunkSaver only. Takes all objects of a heritage type and saves their sprite name, x, and y to the map with a given key to the chunk's json map.
///arg parentType - what type of object to process
///arg key - what key to save this as.


var _parent = argument0;
var _key = argument1;
var _grid = ds_grid_create(3, 0);



//So this is pretty simple. All terrain walls are a child of this object type, so we can just with to hit them all.
//There's no concern about order because these are the same "layer". The designer of the chunk needs to consider the possibility when placing shit on the same layer.
with (_parent)
{
	//Each item adds a row to the grid.
	mDsGridAddRow(_grid);
	
	//I realize the column indices are magic numbers. Not sure this is even gonna stay as a grid. Right now, I just wanna get this going and optimize later. Consider this a TODO.
	//TODO: See above comment.
	ds_grid_set(_grid, 0, ds_grid_height(_grid) - 1, sprite_get_name(sprite_index));
	ds_grid_set(_grid, 1, ds_grid_height(_grid) - 1, x);
	ds_grid_set(_grid, 2, ds_grid_height(_grid) - 1, y);
}


ds_map_set(chunkInfo, _key, ds_grid_write(_grid));
ds_grid_destroy(_grid);