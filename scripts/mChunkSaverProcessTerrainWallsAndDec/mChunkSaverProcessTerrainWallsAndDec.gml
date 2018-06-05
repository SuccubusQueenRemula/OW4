///@description To be called by oWorldChunkSaver only. Fills a grid with information about the walls to be drawn for this chunk, then writes it as a key in the chunk info map.


var _grid = ds_grid_create(3, 0);



//So this is pretty simple. All terrain walls are a child of this object type, so we can just with to hit them all.
//There's no concern about order because these are the same "layer". The designer of the chunk needs to consider the possibility when placing shit on the same layer.
with (oChunkCreatorTerrainWall)
{
	//Each item adds a row to the grid.
	mDsGridAddRow(_grid);
	
	//I realize the column indices are magic numbers. Not sure this is even gonna stay as a grid. Right now, I just wanna get this going and optimize later. Consider this a TODO.
	//TODO: See above comment.
	ds_grid_set(_grid, 0, ds_grid_height(_grid) - 1, sprite_get_name(sprite_index));
	ds_grid_set(_grid, 1, ds_grid_height(_grid) - 1, x);
	ds_grid_set(_grid, 2, ds_grid_height(_grid) - 1, y);
}


ds_map_set(chunkInfo, "terrainWalls", ds_grid_write(_grid));
ds_grid_destroy(_grid);