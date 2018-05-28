///@description Cross chunk border

global.worldX++;

//These are iterators that we will be using in the upcoming loops to go through the world grid.
var _y, _x;

//Plugged in my the mConceiveBorderCrossing method.
var _w = worldGridW;
var _h = worldGridH;
var _worldGrid = worldGrid;

//Unloaded does not mean unloadING. This is a chunk that will load but has not yet (since it takes a while).
//It will be an oChunkLoader object.
var _unloadedChunk = noone;

//The working chunk is either being moved (because the world has shifted as the player crossed a border),
//or it being destroyed (also because it moved because it moved out of scope.)
var _workingChunk = noone;



//Right border? Pull everything left one, deleting the original left column and leaving the right empty.
for (_y = 0; _y < _h; _y++)
{
	for (_x = 0; _x < _w; _x++)
	{
		//Everything is pulled left one. This is the far right column,
		//so it will remain empty and must be filled with unloaded chunks.
		if (_x == _w - 1)
		{
			_unloadedChunk = instance_create_depth(((_x - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_y - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
			mDesignateChunkLoaderFile(_unloadedChunk, _x, _y);
			ds_grid_set(_worldGrid, _x, _y, _unloadedChunk);
		}
					
		else
		{
			//Everything that isn't the far right gets copied from the node to its right.
			//If it's the far left column, we totally destroy it first.
			if (_x == 0)
			{		
				_workingChunk = ds_grid_get(_worldGrid, _x, _y);
				instance_destroy(_workingChunk);
			}
						
			_workingChunk = ds_grid_get(_worldGrid, _x + 1, _y);
			ds_grid_set(_worldGrid, _x, _y, _workingChunk);
		}
	}
}