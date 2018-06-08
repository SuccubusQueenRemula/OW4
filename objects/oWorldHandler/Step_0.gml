var _worldWidth = ds_grid_width(worldChunks);
var _worldHeight = ds_grid_height(worldChunks);
var _worldChunk = noone;


//*********************************************************************
//******************WRITTEN ON JUNE 7TH, 2018!!************************
//*********************************************************************

//Originally, I had this iterating over the grid every frame to ensure the position was right.
//The only real time this proved to be required was right after crossing a border and reorienting the entire grid.
//The entire world would look fucked for half a second until the chunk loader completed its work and reoriented everything right.
//So I started doing this every step.
//Then I realized I just need to do this right after the loaders are made but before the load begins.
//After that, chunk x/y will stay correct due to world push/pull.
//I'm leaving it here for a while in case I need to undo it.
//If it's been a while, feel free to delete this.

//for (var _wy = 0; _wy < _worldHeight; _wy++)
//{
//	for (var _wx = 0; _wx < _worldWidth; _wx++)
//	{
		
//		//For every world chunk...
//		_worldChunk = ds_grid_get(worldChunks, _wx, _wy);
//		if (_worldChunk != noone)
//		{
//				//Set each world chunk's x and y position in the world.
			
//				//var _xx = global.worldChunkOffsetX + ((_wx - 1) * global.chunkWidth);
//				//_worldChunk.x = _xx;
//				//var _yy = global.worldChunkOffsetY + ((_wy - 1) * global.chunkHeight);
//				//_worldChunk.y = _yy;
//		}
//	}
//}