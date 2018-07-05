///@description Draws all of an overhead canvas' sprites to its surface for later use. Called during a chunk's load and any time the surface is lost.

//Ensure the surface exists.
if (!surface_exists(surface))
{
	surface = surface_create(global.chunkWidth, global.chunkHeight);
}

surface_set_target(surface);
draw_clear_alpha(c_black, 0);

var _y = 0;
var _sprite = noone;
var _roofsH = ds_grid_height(overheadRoofs);


//Draw the roofs onto the surface
for (_y = 0; _y < _roofsH; _y++)
{
	_sprite = ds_grid_get(overheadRoofs, ChunkCanvasDataColumns.SpriteIndex, _y);
	
	if (sprite_exists(_sprite))
	{
		draw_sprite(_sprite, 0, ds_grid_get(overheadRoofs, ChunkCanvasDataColumns.SpriteX, _y), ds_grid_get(overheadRoofs, ChunkCanvasDataColumns.SpriteY, _y));
	}
}


//These disk write operations are causing too much of a hiccup right now. I need to find a good way to make client logging asynchronous before I can do these.
//mClientLogAddEntry("Overhead surface created for X: " + string(owner.xCoord) + " Y: " + string(owner.yCoord) + ". SURFACE ID WAS " + string(surface));
surface_reset_target();