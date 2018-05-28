///@description Given a coordinate for X and Y, returns a file name of a world chunk.
///@arg x - The x of where the chunk file is in the world.
///@arg y - The y of where the chunk file is in the world.

//THE FILE IS NOT GUARANTEED TO EXIST. This method only returns what the file would be called if a chunk existed at that X and Y.
//If the chunk does not exist but is attempted to be loaded, the error chunk will load instead, so it's still safe.]

var _x = argument0;
var _y = argument1;

//We will only do work if we were given two real numbers. Otherwise we'll just be returning the error chunks.
if (is_real(_x) && is_real(_y))
{
	return "World/" + "X" + string(_x) + "Y" + string(_y) + CHUNK_FILE_EXT;
}
else
{
	return ERROR_CHUNK_FILE;
}