///@description Takes whatever is in a world grid node, be it a chunk or a chunk loader, and updates its position, as well as the position of all objects it manages. For loaders, this is the chunk. For chunks, this is the overhead canvas.
///@arg content - The content of the world grid node.
///@arg x - the x to update to.
///@arg y - the y to update to.

var _content = argument0;
var _x = argument1;
var _y = argument2;

//The object always gets its pos updated.
_content.x = _x;
_content.y = _y;

//But we also need to update objects it has ownership of. This depends on whether the object is a chunk of a chunk loader.
if (_content.object_index == oWorldChunkLoader)
{
	_content.loadingWorldChunk.x = _x;
	_content.loadingWorldChunk.y = _y;
	_content.loadingWorldChunk.overheadCanvas.x = _x;
	_content.loadingWorldChunk.overheadCanvas.y = _y;
	//_content.loadingWorldChunk.overheadParallaxCanvas.x = _x + global.worldChunkOffsetX * 2;
	//_content.loadingWorldChunk.overheadParallaxCanvas.y = _y + global.worldChunkOffsetY * 2;
	
}

else if (_content.object_index == oWorldChunk)
{
	_content.overheadCanvas.x = _x;
	_content.overheadCanvas.y = _y;
//	_content.overheadParallaxCanvas.x = _x - 512;
	//_content.overheadParallaxCanvas.y = _y - 512;
}