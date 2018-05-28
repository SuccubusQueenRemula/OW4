////First of all, because the two unload borders are side-by-side,
////it's imperative that we not run this code if the player is standing on as few as possible.
////Thus we only use the origin point of the player to check the collision.
//var _ox = oPlayer.x;
//var _oy = oPlayer.y;
//var _unloadedChunk = noone;





////Memorize own ID because the oWorldHandler is about to take over.
//var _unloadZone = id;
//var _parentChunk = parentChunk;


//with (oWorldHandler)
//{
//	//Grab the dimensions of the world grid.
//	var _gridHeight = ds_grid_height(worldChunks);
//	var _gridWidth = ds_grid_width(worldChunks);
//	var _gridCenterX = (_gridWidth - 1) / 2;
//	var _gridCenterY = (_gridHeight - 1) / 2;
//	//Determine what the center world chunk is.
//	var _centerChunk = ds_grid_get(worldChunks, _gridCenterX, _gridCenterY);
	
//	//Is this chunk the same as the parent of the collided border?
//	//If so, the player is leaving the center of the world and we need to re-orient.
//	if (_parentChunk == _centerChunk)
//	{
		
//		var _yy = 0;
//		var _xx = 0;
//		var _workingChunk = noone;
//		//Now we determine WHICH border we touched and unload the other zones accordingly.
		
//		#region TopBorder
//		if (_unloadZone = _parentChunk.topBorder)
//		{
//			//Top border? We're moving up. Pull everything down one, deleting the bottom row.
//			for (_yy = _gridHeight - 1; _yy > - 1; _yy--)
//			{
//				for (_xx = 0; _xx < _gridWidth; _xx++)
//				{
//					//This is a top row chunk. It needs to be set to noone to remain unloaded.
//					if (_yy == 0)
//					{
						
//						_unloadedChunk = instance_create_depth(((_xx - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_yy - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
//						ds_grid_set(worldChunks, _xx, _yy, _unloadedChunk);
//					}
					
//					//Otherwise, we copy the row above. If this is a bottom row chunk, we delete the old value
//					//That row has been pushed totally out of the grid.
//					else 
//					{
//						if (_yy == _gridHeight - 1)
//						{		
//							_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
//							instance_destroy(_workingChunk);
//						}
//						_workingChunk = ds_grid_get(worldChunks, _xx, _yy - 1);
//						ds_grid_set(worldChunks, _xx, _yy, _workingChunk);
//					}
//				}
//			}
			
			
			
			
//			//Regrab the center chunk, which is now a different one.
//			_centerChunk = ds_grid_get(worldChunks, (_gridWidth - 1) / 2, (_gridHeight - 1) / 2);
//			global.worldChunkOffsetX = _centerChunk.x;
//			global.worldChunkOffsetY = _centerChunk.y;
			
//		}
//		#endregion TopBorder
		
//		#region RightBorder
//		else if (_unloadZone = _parentChunk.rightBorder)
//		{
//			//Right border? Pull everything left one, deleting the original left column and leaving the right empty.
//			for (_yy = 0; _yy < _gridHeight; _yy++)
//			{
//				for (_xx = 0; _xx < _gridWidth; _xx++)
//				{
//					//Everything is pulled left one. This is the far right column,
//					//so it will remain empty and must be filled with unloaded chunks.
//					if (_xx == _gridWidth - 1)
//					{
//						_unloadedChunk = instance_create_depth(((_xx - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_yy - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
//						ds_grid_set(worldChunks, _xx, _yy, _unloadedChunk);
//					}
					
//					else
//					{
//						//Everything that isn't the far right gets copied from the node to its right.
//						//If it's the far left column, we totally destroy it first.
//						if (_xx == 0)
//						{		
//							_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
//							instance_destroy(_workingChunk);
//						}
						
//						_workingChunk = ds_grid_get(worldChunks, _xx + 1, _yy);
//						ds_grid_set(worldChunks, _xx, _yy, _workingChunk);
//					}
//				}
//			}
			
//			_centerChunk = ds_grid_get(worldChunks, (_gridWidth - 1) / 2, (_gridHeight - 1) / 2);
//			global.worldChunkOffsetX = _centerChunk.x;
//			global.worldChunkOffsetY = _centerChunk.y;
			
//		}
		
//		#endregion RightBorder

//		#region BottomBorder
		
//		else if (_unloadZone = _parentChunk.bottomBorder)
//		{
//			//Top border? We're moving up. Pull everything down one, deleting the bottom row.
//			for (_yy = 0; _yy < _gridHeight; _yy++)
//			{
//				for (_xx = 0; _xx < _gridWidth; _xx++)
//				{
//					//This is a bottom row chunk. It needs to become an unloaded chunk.
//					if (_yy == _gridHeight - 1)
//					{
						
//						_unloadedChunk = instance_create_depth(((_xx - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_yy - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
//						ds_grid_set(worldChunks, _xx, _yy, _unloadedChunk);
//					}
					
//					//Otherwise, we copy the row above. If this is a bottom row chunk, we delete the old value
//					//That row has been pushed totally out of the grid.
//					else 
//					{
//						if (_yy == 0)
//						{		
//							_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
//							instance_destroy(_workingChunk);
//						}
//						_workingChunk = ds_grid_get(worldChunks, _xx, _yy + 1);
//						ds_grid_set(worldChunks, _xx, _yy, _workingChunk);
//					}
//				}
//			}
			
//			//Regrab the center chunk, which is now a different one.
//			_centerChunk = ds_grid_get(worldChunks, (_gridWidth - 1) / 2, (_gridHeight - 1) / 2);
//			global.worldChunkOffsetX = _centerChunk.x;
//			global.worldChunkOffsetY = _centerChunk.y;
			
//		}
		
		
//		#endregion BottomBorder

//		#region LeftBorder
		
//		else if (_unloadZone = _parentChunk.leftBorder)
//		{
//			//Right border? Pull everything left one, deleting the original left column and leaving the right empty.
//			for (_yy = 0; _yy < _gridHeight; _yy++)
//			{
//				for (_xx = _gridWidth - 1; _xx > - 1; _xx--)
//				{
//					//Everything is pulled right one. This is the far left column,
//					//so it will remain empty and must be filled with unloaded chunks.
//					if (_xx == 0)
//					{
//						_unloadedChunk = instance_create_depth(((_xx - 1) * global.chunkWidth) + global.worldChunkOffsetX, ((_yy - 1) * global.chunkHeight) + global.worldChunkOffsetY, 1600, oWorldChunkLoader);
//						ds_grid_set(worldChunks, _xx, _yy, _unloadedChunk);
//					}
					
//					else
//					{
//						//Everything that isn't the far left gets copied from the node to its left
//						//If it's the far right column, we totally destroy it first, because it is
//						//going to be outside of the 3x3 grid.
//						if (_xx == _gridWidth - 1)
//						{		
//							_workingChunk = ds_grid_get(worldChunks, _xx, _yy);
//							instance_destroy(_workingChunk);
//						}
						
//						_workingChunk = ds_grid_get(worldChunks, _xx - 1, _yy);
//						ds_grid_set(worldChunks, _xx, _yy, _workingChunk);
//					}
//				}
//			}
			
//			_centerChunk = ds_grid_get(worldChunks, (_gridWidth - 1) / 2, (_gridHeight - 1) / 2);
//			global.worldChunkOffsetX = _centerChunk.x;
//			global.worldChunkOffsetY = _centerChunk.y;
			
//		}
		
		
//		#endregion LeftBorder
		

//	}
//}


//var _test = 0;


