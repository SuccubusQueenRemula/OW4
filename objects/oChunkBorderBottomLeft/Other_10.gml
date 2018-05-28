/// @description Chunk cross border

global.worldX--;
global.worldY++;

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




//We're heading downleft? Then everything must be pulled upright one.
//So start from right and top.
for (_y = 0; _y < _w; _y++)
{
	for (_x = _w - 1; _x > -1; _x--)
	{
					
		//In the special case of the topleft and bottomright cells...
		if ((_y == 0 && _x == 0)|| (_y == _h - 1 && _x == _h - 1))
		{
			//...these cells are actually deleted totally AND given new loading chunks
			//So first we delete the current contents of the cell.
			_workingChunk = ds_grid_get(_worldGrid, _x, _y)
			instance_destroy(_workingChunk);
			//Then we load whatever would be one downright of it in the greater world. Currently just loads whatever.
			_unloadedChunk = instance_create_depth(((_x - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_y - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
			mDesignateChunkLoaderFile(_unloadedChunk, _x, _y);
			ds_grid_set(_worldGrid, _x, _y, _unloadedChunk);
		}
					
		//Now if the cell is left or bottom, it needs to be loaded.
		else if (_y == _h - 1 || _x == 0)
		{
						
			_unloadedChunk = instance_create_depth(((_x - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_y - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
			mDesignateChunkLoaderFile(_unloadedChunk, _x, _y);
			ds_grid_set(_worldGrid, _x, _y, _unloadedChunk);
		}
					
		//Otherwise, we copy the cell downleft of it. If this is a top row or left column chunk, we delete the old value
		//That cell has been pushed totally out of the grid.
		else 
		{
			if (_y == 0 || _x == _w - 1)
			{		
				_workingChunk = ds_grid_get(_worldGrid, _x, _y);
				instance_destroy(_workingChunk);
			}
			_workingChunk = ds_grid_get(_worldGrid, _x - 1, _y + 1);
			ds_grid_set(_worldGrid, _x, _y, _workingChunk);
		}
	}
}