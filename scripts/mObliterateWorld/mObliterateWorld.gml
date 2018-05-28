///@description Totally removes all chunks and borders.

mClearWorldChunks();
mClearChunkBorders();

with (all)
{	
	if (!object_is_ancestor(object_index, oSingleton) && !mIsHeritageOrEqual(object_index, oPlayer))
	{
		instance_destroy();
	}
}