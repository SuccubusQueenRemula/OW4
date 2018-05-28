//First of all, because the two unload borders are side-by-side,
//it's imperative that we not run this code if the player is standing on as few as possible.
//Thus we only use the origin point of the player to check the collision.
var _ox = oPlayer.x;
var _oy = oPlayer.y;






//Memorize own ID because the oWorldHandler is about to take over.
var _unloadZone = id;
var _parentChunk = parentChunk;


with (oWorldHandler)
{
	//Determine what the center world chunk is.
	var _centerChunk = ds_grid_get(worldChunks, 1, 1);
	
	//Is this chunk the same as the parent of the collided border?
	//If so, the player is leaving the center of the world and we need to re-orient.
	if (_parentChunk == _centerChunk)
	{
		//Grab the dimensions of the world grid.
		var _gridHeight = ds_grid_height(worldChunks);
		var _gridWidth = ds_grid_width(worldChunks);
		var _yy = 0;
		var _xx = 0;
		var _workingChunk = noone;
		//Now we determine WHICH border we touched and unload the other zones accordingly.
		if (_unloadZone = _parentChunk.topBorder)
		{
			//Top border? We're moving up. Pull everything down one, deleting the bottom row.
			for (_yy = _gridHeight - 1; _yy > - 1; _yy--)
			{
				for (_xx = 0; _xx < _gridWidth; _xx++)
				{
					if (_yy == 0)
					{
						//This is a top row chunk. It needs to be deleted.
						_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
						ds_grid_set(worldChunks, _xx, _yy, noone);
						instance_destroy(_workingChunk);
					}
					
					else
					{
						//This isn't a top row chunk. We copy the row above it.
						_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
						ds_grid_set(worldChunks, _xx, _yy, _workingChunk);
					}
				}
			}
		}
	}
}



////If this is a border of the parent center chunk, then the player is touching the edge of the active chunk.
//if (parentChunk == _centerChunk)
//{
//	//If this is the top border, pull every cell in the grid down.
//	if (id == _centerChunk.topBorder)
//	{
//		with (oWorldHandler)
//		{
//			for (var _yy = 0; _yy 
//		}
//	}
//	else if (id == _centerChunk.rightBorder)
//	{
//	}
//}



