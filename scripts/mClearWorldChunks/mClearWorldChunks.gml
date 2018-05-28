///@description Destroys all world chunks and world chunk loaders. Fills the chunk grid with the noone value.

with (oWorldHandler)
{
	var _h = ds_grid_height(worldChunks);
	var _w = ds_grid_width(worldChunks);
	var _value = noone;
	
	for (var _y = 0; _y < _h; _y++)
	{
		for (var _x = 0; _x < _w; _x++)
		{
			_value = ds_grid_get(worldChunks, _x, _y);
			instance_destroy(_value);
			ds_grid_set(worldChunks, _x, _y, noone);
		}
	}
}