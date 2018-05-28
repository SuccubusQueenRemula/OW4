///@description Provides a chunk loader with what its loading file should be, based on its position in the world grid and the current X/Y of the center chunk.
///@arg chunkLoader - the chunk loader to apply the file to.
///@arg gridX - The loader's X position in the 3x3 world grid.
///@arg gridY - The loader's Y position in the 3x3 world grid.

var _chunkLoader = argument0;
var _gridX = argument1;
var _gridY = argument2;

//Each coord needs to be subtracted by one to create the value it would have relative to current world position.
//For example, the leftmost item is at 0 for X, but will be -1 X of the current world coord.
_gridX--;
_gridY--;

var _chunkWorldX = global.worldX + _gridX;
var _chunkWorldY = global.worldY + _gridY;

var _fileName = "X" + string(_chunkWorldX) + "Y" + string(_chunkWorldY) + ".json";

_chunkLoader.chunkFile = _fileName;