///@description A temporary test method to load a world chunk's terrain with a single type.
///@arg worldChunkID - The instance ID of the world chunk to fill with a single sprite.
///@arg sprite - The sprite to fill the world chunk with.

var _worldChunkID = argument0;
var _sprite = argument1;

with (_worldChunkID)
{
	//Confirm all the data we'll be working with is what we want.
	if (object_index == oWorldChunk && ds_exists(tileGrid, ds_type_grid))
	{
		//Measure the grid and prep the iterators to fill this grid with one sprite.
		var _gridHeight = ds_grid_height(tileGrid);
		var _gridWidth = ds_grid_width(tileGrid);
		var _i = 0;
		var _j = 0;

		//Iterate through every cell in the grid and add our sprite to it.
		for (_i = 0; _i < _gridHeight; _i++)
		{
			_j = 0;
			for (_j = 0; _j < _gridWidth; _j++)
			{
				ds_grid_set(tileGrid, _j, _i, _sprite);
			}
		}
	}
}