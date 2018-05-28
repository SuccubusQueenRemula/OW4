/// @description Cross Border

global.worldY--;

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




//Top border? We're moving up. Pull everything down one, deleting the bottom row.
for (_y = _h - 1; _y > - 1; _y--)
{
	for (_x = 0; _x < _w; _x++)
	{
		//This is a top row chunk. It needs to be set to noone to remain unloaded.
		if (_y == 0)
		{
						
			_unloadedChunk = instance_create_depth(((_x - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_y - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
			mDesignateChunkLoaderFile(_unloadedChunk, _x, _y);
			ds_grid_set(_worldGrid, _x, _y, _unloadedChunk);
		}
					
		//Otherwise, we copy the row above. If this is a bottom row chunk, we delete the old value
		//That row has been pushed totally out of the grid.
		else 
		{
			if (_y == _h - 1)
			{		
				_workingChunk = ds_grid_get(_worldGrid, _x, _y);
				instance_destroy(_workingChunk);
			}
			_workingChunk = ds_grid_get(_worldGrid, _x, _y - 1);
			ds_grid_set(_worldGrid, _x, _y, _workingChunk);
		}
	}
}