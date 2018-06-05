///@description To be called by oWorldChunkSaver in a chunk creator room. Uses chunk creator tiles to fill the terrain grid.

var _terrainGrid = ds_grid_create(global.chunkWidth / global.tileSize, global.chunkHeight / global.tileSize);

with (oChunkCreatorTile)
{
	//The coordinate each tile will belong in the grid is their room position over the tile size.
	var _tilePosX = x / global.tileSize;
	var _tilePosY = y / global.tileSize;

	//Now just add that sprite's name to the grid at this position.
	//We don't worry about ID until we load it, which will let rendering it load faster.
	ds_grid_set(_terrainGrid, _tilePosX, _tilePosY, sprite_get_name(sprite_index));
}

//Add the list of tiles to the map, then destroy it.
ds_map_set(chunkInfo, "chunkTiles", ds_grid_write(_terrainGrid));
ds_grid_destroy(_terrainGrid);