///@description Given the X/Y of an object, determines which chunk that object is on. Gives the object a "detChunkX" and "detChunkY" value. Returns true with a successful determination.
///@arg object - the object to determine which chunk it landed on.

var _object = argument0;
var _ox = _object.x;
var _oy = _object.y;

with (oWorldChunk)
{
	if ((_ox > x && _ox < x + global.chunkWidth) && (_oy > y && _oy < y + global.chunkHeight))
	{
		//This is the chunk the object has landed on. Find out which on it is.
		var _id = id;
		with (oWorldHandler)
		{
			//World grid height and width
			var _h = ds_grid_height(worldChunks);
			var _w = ds_grid_width(worldChunks);
			var _value = noone;
			
			for (var _y = 0; _y < _h; _y++)
			{
				for (var _x = 0; _x < _w; _x++)
				{
					_value = ds_grid_get(worldChunks, _x, _y);
					//This is the matching world chunk it matches this grid node.
					if (_value = _id)
					{
						_object.detChunkX = global.worldX + (_x - 1);
						_object.detChunkY = global.worldY + (_y - 1);
						_object.currentChunk = _value;
						_object.localX = _object.x - _value.x;
						_object.localY = _object.y - _value.y;
						return true;
					}
				}
			}
		}
	}
}

return false;