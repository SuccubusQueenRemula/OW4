///@arg loadingWorldChunk - the world chunk to load info into.
///@arg worldChunkX - The leftmost pixel of this world chunk.
///@arg worldChunkY - The topmost pixel of this world chunk.
///@arg chunkInfo - The ds_map containing the info to populate the chunk with.
///@arg chunkName - The name of this chunk for giving CHIDs.


var _loadingWorldChunk = argument0;
var _chunkX = argument1;
var _chunkY = argument2;
var _chunkInfo = argument3;
var _chunkName = argument4;

if (_chunkX == 1001 && _chunkY == 1001)
{
	var _stopHere = true;
}


_loadingWorldChunk.x = _chunkX;
_loadingWorldChunk.y = _chunkY;

//Let's just double check that nothing happened to the chunkfileInfo. Should still be a ds_map.
if (ds_exists(_chunkInfo, ds_type_map))
{
	//Grab the strings which represent the various bits of data.
	var _chunkTilesString = ds_map_find_value(_chunkInfo, "chunkTiles");
	var _chunkTerrainWallsString = ds_map_find_value(_chunkInfo, "terrainWalls");	
	var _instanceListString = ds_map_find_value(_chunkInfo, "chunkInstances");
	
	
	
	mChunkLoaderPopulateTerrainTiles(_loadingWorldChunk, _chunkTilesString);
	mChunkLoaderPopulateTerrainWalls(_loadingWorldChunk, _chunkTerrainWallsString);
	mChunkLoaderPopulateInstancesAll(_loadingWorldChunk, _instanceListString, _chunkX, _chunkY, _chunkName);
	
}
