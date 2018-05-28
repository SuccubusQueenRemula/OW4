/// @description Cross Border

global.worldX--;

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


//Left border? Pull everything right one, deleting the original right column and leaving the left empty.
for (_y = 0; _y < _h; _y++)
{
	for (_x = _w - 1; _x > - 1; _x--)
	{
		//Everything is pulled right one. This is the far left column,
		//so it will remain empty and must be filled with unloaded chunks.
		if (_x == 0)
		{
			_unloadedChunk = instance_create_depth(((_x - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_y - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
			mDesignateChunkLoaderFile(_unloadedChunk, _x, _y);
			ds_grid_set(_worldGrid, _x, _y, _unloadedChunk);
		}
					
		else
		{
			//Everything that isn't the far left gets copied from the node to its left
			//If it's the far right column, we totally destroy it first, because it is
			//going to be outside of the 3x3 grid.
			if (_x == _w - 1)
			{		
				_workingChunk = ds_grid_get(_worldGrid, _x, _y);
				instance_destroy(_workingChunk);
			}
						
			_workingChunk = ds_grid_get(_worldGrid, _x - 1, _y);
			ds_grid_set(_worldGrid, _x, _y, _workingChunk);
		}
	}
}			