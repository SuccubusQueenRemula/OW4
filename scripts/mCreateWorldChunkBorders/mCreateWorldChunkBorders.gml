///@description Creates the four surrounding borders of a world chunk.
///@arg worldChunk - the chunk to add borders to

var _worldChunk = argument0;


//Ensure this object is a world chunk and that it is the center chunk.
with (_worldChunk)
{	
	if (object_index == oWorldChunk && id == ds_grid_get(oWorldHandler.worldChunks, 1, 1))
	{
		//This is validly the center chunk. We can give it borders.
		//Destroy all existing borders before we remake them.
		with (oWorldChunkBorder)
		{
			instance_destroy();
		}
		
		//Each border type's create event has the code to assign it to a proper x/y and x_scale/y_scale.

		//Make the cardinal sides.
		//topBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderTop);
		//rightBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderRight);			
		//bottomBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderBottom);
		//leftBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderLeft);

		//Make the corners.
		//bottomLeftBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderBottomLeft);
		//bottomRightBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderBottomRight);
		//topRightBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderTopRight);
		//topLeftBorder = 
		instance_create_depth(x, y, Depths.DebugDisplay, oChunkBorderTopLeft);	
		
		//Now assign all of them to have this chunk as the parent.
		//todo: There might not be a need for a parent anymore. After all, the center chunk is always
		//the only one with borders AND the borders know what type they are.
		with (oWorldChunkBorder)
		{
			parentChunk = other;
		}
	}
}