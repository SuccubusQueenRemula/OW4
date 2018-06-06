///@description This is a part of the mPopulateWorldChunk method. Mostly this is just to keep the other method a bit more organized. This loads the tiles, converting them from their sprite name to an actual sprite index along the way.
///@arg chunk - the chunk this is for.
///@arg string - The grid string to read into a grid.

var _chunk = argument0;
var _str = argument1;


//First, create the grid we'll be using.
var _grid = ds_grid_create(16, 16);
ds_grid_read(_grid, _str);



//Get the dimensions of the grid.
var _h = ds_grid_height(_grid);
var _w = ds_grid_width(_grid);

//We will be converting each item in the grid from the NAME of a sprite to an actual sprite ID.
//todo: This is slow but it's the only way to safely ensure that when a chunk is designed/edited, that
//the assets match up in case their index has changed.
var _value = noone;
var _sprite = noone;
	
for (var _y = 0; _y < _h; _y++)
{
	for (var _x = 0; _x < _w; _x++)
	{
		var _value = ds_grid_get(_grid, _x, _y);
		_sprite = asset_get_index(_value);
		ds_grid_set(_grid, _x, _y, _sprite);
	}
}
	
//Now destroy the grid plugged into the chunk and replace with this one.
if (ds_exists(_chunk.tileGrid, ds_type_grid))
{
	ds_grid_destroy(_chunk.tileGrid);
}
_chunk.tileGrid = _grid;