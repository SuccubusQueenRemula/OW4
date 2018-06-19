//The world chunks are arranged in a 3x3 grid.
//worldChunks = ds_grid_create(3, 3);

mDsCreateGrid(id, "worldChunks", 3, 3);

depth = 15000;


mLoadWorldAtCenterChunk(1000, 1000);