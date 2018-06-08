///@description Called when the player is colliding with a chunk border. Sets up the unloading/loading of chunks.




//First of all, because unload borders are side-by-side,
//it's imperative that we only detect a collision with one at a time.
//Thus we only use the origin point of the player to check the collision.
var _ox = oPlayer.x;
var _oy = oPlayer.y;
var _unloadedChunk = noone;





//Memorize own ID because the oWorldHandler is about to take over.
var _unloadZone = id;
var _parentChunk = parentChunk;


//This method needs to be called specifically by the world handler.
with (oWorldHandler)
{
	//Grab the dimensions of the world grid. I think this is ALWAYS 3x3 but who knows?
	var _h = ds_grid_height(worldChunks);
	var _w = ds_grid_width(worldChunks);
	var _gridCenterX = (_w - 1) / 2;
	var _gridCenterY = (_h - 1) / 2;
	
	//Determine what the center world chunk is.
	var _centerChunk = ds_grid_get(worldChunks, _gridCenterX, _gridCenterY);
	var _worldChunks = worldChunks;
	
	//Is this chunk the same as the parent of the collided border?
	//If so, the player is leaving the center of the world and we need to re-orient.
	if (_parentChunk == _centerChunk)
	{
		
		var _workingChunk = noone;

		with (_unloadZone)
		{
			mCrossChunkBorder(_worldChunks);
		}

		
		//Realign what the center chunk is.
		_centerChunk = ds_grid_get(worldChunks, _gridCenterX, _gridCenterY);
		global.worldChunkOffsetX = _centerChunk.x;
		global.worldChunkOffsetY = _centerChunk.y;
	//	mPurgeUnloadZones(_centerChunk);
		mCreateWorldChunkBorders(_centerChunk);
		
		for (var _y = 0; _y < _h; _y++)
		{
			for (var _x = 0; _x < _w; _x++)
			{
				//Get the item at this node.
				var _content = ds_grid_get(worldChunks, _x, _y);
				//Calculate new coords for this item.
				var _xx = global.worldChunkOffsetX + ((_x - 1) * global.chunkWidth);
				var _yy = global.worldChunkOffsetY + ((_y - 1) * global.chunkHeight);
				mUpdateWorldGridNodePos(_content, _xx, _yy);
			}
		}
	}
}