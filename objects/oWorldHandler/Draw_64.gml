var _gridHeight = ds_grid_height(worldChunks);
var _gridWidth = ds_grid_width(worldChunks);
var _value = noone;

if (global.debugMode)
{
	//Draw loaded chunk grid if debug.
	for (var _yy = 0; _yy < _gridHeight; _yy++)
	{	
		for (var _xx = 0; _xx < _gridWidth; _xx++)
		{
			_value = ds_grid_get(worldChunks, _xx, _yy);
			if (_value != noone)
			{
				if (_value.object_index == oWorldChunkLoader)
				{
					draw_sprite(sWorldChunkStatus, 1, (16 * _xx) + 3, (16 * _yy) + 3);
				}
				else if (_value.object_index == oWorldChunk)
				{
					draw_sprite(sWorldChunkStatus, 0, (16 * _xx) + 3, (16 * _yy) + 3);
				}
			}		 
		}
	}
	
	//Draw the current global coords.
	draw_set_color(c_white);
	draw_text(80, 3, "Global X: " + string(global.worldX) + ", Global Y: " + string (global.worldY));
	draw_set_color(c_black);
	draw_text(82, 3, "Global X: " + string(global.worldX) + ", Global Y: " + string (global.worldY));
	
	
}
