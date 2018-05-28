//mFillWorldChunk(loadingWorldChunk, choose(sTestSand, sTestSnow, sTestDirt, sTestGrass));

//Let's just double check that nothing happened to the chunkInfo. Should still be a ds_map.
if (ds_exists(chunkInfo, ds_type_map))
{
	//Grab the string that represents the tilegrid.
	var _chunkTilesString = ds_map_find_value(chunkInfo, "chunkTiles");
	
	//Destroy the default tile grid plugged into the loading chunk and replace with this one.
	if (ds_exists(loadingChunk.tileGrid, ds_type_grid))
	{
		ds_grid_destroy(loadingChunk.tileGrid);
	}
	
	_newTileGrid = ds_grid_create(16, 16);
	_newTileGrid = ds_grid_read(_chunkTilesString);
}
