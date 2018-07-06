///@description To be called by oWorldChunkLoader during its load process. Replaces itself in the grid with its world chunk, then marks itself for deletion in 2-3 more frames.

//Get the world grid and store its dimensions.
var _worldGrid = oWorldHandler.worldChunks;

var _gridWidth = ds_grid_width(_worldGrid);
var _gridHeight = ds_grid_height(_worldGrid);


for (var _yy = 0; _yy < _gridHeight; _yy++)
{
	for (var _xx = 0; _xx < _gridWidth; _xx++)
	{
		//For every node in the grid...
		var _value = ds_grid_get(_worldGrid, _xx, _yy);
		//... if this is that node...
		if (_value == id)
		{
			//Orient the X & Y coordinates of this chunk in the room.
			var _wx = global.worldChunkOffsetX + ((_xx - 1) * global.chunkWidth);
			loadingWorldChunk.x = _wx;
			var _wy = global.worldChunkOffsetY + ((_yy - 1) * global.chunkHeight);
			loadingWorldChunk.y = _wy;	
			//Create the borders of this world chunk and assign them to what edge they are.
			mCreateWorldChunkBorders(loadingWorldChunk);
			
			//Replace the world chunk loader with the world chunk itself, mark the loading complete, and destroy self.
			ds_grid_set(_worldGrid, _xx, _yy, loadingWorldChunk);	
			alarm[5] = 3;
			//No need to iterate through the grid further.
			exit;
		}
	}
}