var _worldWidth = ds_grid_width(worldChunks);
var _worldHeight = ds_grid_height(worldChunks);
var _worldChunk = noone;


for (var _wy = 0; _wy < _worldHeight; _wy++)
{
	for (var _wx = 0; _wx < _worldWidth; _wx++)
	{
		
		//For every world chunk...
		_worldChunk = ds_grid_get(worldChunks, _wx, _wy);
		if (_worldChunk != noone)
		{
				//Set each world chunk's x and y position in the world.
			
				var _xx = global.worldChunkOffsetX + ((_wx - 1) * global.chunkWidth);
				_worldChunk.x = _xx;
				var _yy = global.worldChunkOffsetY + ((_wy - 1) * global.chunkHeight);
				_worldChunk.y = _yy;
		}
	}
}