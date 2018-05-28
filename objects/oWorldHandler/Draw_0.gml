var _worldWidth = ds_grid_width(worldChunks);
var _worldHeight = ds_grid_height(worldChunks);
var _worldChunk = noone;
var _centerChunk = ds_grid_get(worldChunks, 1, 1);
var _draw = false;
var _px = oPlayer.x;
var _py = oPlayer.y;

//For every world chunk...
for (var _wy = 0; _wy < _worldHeight; _wy++)
{
	for (var _wx = 0; _wx < _worldWidth; _wx++)
	{
		_worldChunk = ds_grid_get(worldChunks, _wx, _wy)
		
		//..we grab every single tile in that world chunk...
		with (_worldChunk)
		{
			
			if (object_index == oWorldChunk)
			{
				////If this is the center chunk, we already know to draw it.
				//if (id == _centerChunk)
				//{
				//	_draw = true;
				//}
				////If not? Well... let's do a little work.
				//else
				//{
				//	#region DetermineIfDraw
				//	_draw = true;
				//	switch (_wx)
				//	{
				//		case 0:
				//			if (_px > x + (global.chunkWidth * 1.5)) { _draw = false; }
				//			break;
				//		case 2:
				//			if (_px < x - (global.chunkWidth * .5)) { _draw = false; }
				//			break;
				//	}
					
				//	switch (_wy)
				//	{
				//		case 0:
				//			if (_py > y + (global.chunkHeight * 1.5)) { _draw = false; }
				//			break;
				//		case 2:
				//			if (_py < y - (global.chunkHeight * .5)) { _draw = false; }
				//			break;
				//	}
				//	#endregion DetermineDraw
				//}
				
				//if (_draw)
				//{
					if (!surface_exists(terrainSurface))
					{
						mDrawTerrainToSurface();
					}
					
					draw_surface(terrainSurface, x, y);
					
			//	}
			}
		}
	}
}





















