///@description Draws all of an overhead canvas' sprites to its surface for later use. Called during a chunk's load and any time the surface is lost.

//Ensure the surface exists.
if (!surface_exists(surface))
{
	surface = surface_create(global.chunkWidth, global.chunkHeight);
}

surface_set_target(surface);

var _y = 0;
var _sprite = noone;
var _roofsH = ds_grid_height(overheadRoofs);


//Now do the same thing for the edges. The walls only need to go by height.
for (_y = 0; _y < _roofsH; _y++)
{
	_sprite = ds_grid_get(overheadRoofs, 0, _y);
	
	if (sprite_exists(_sprite))
	{
		//TODO: Fix magic numbers.
		draw_sprite(_sprite, 0, ds_grid_get(overheadRoofs, 1, _y), ds_grid_get(overheadRoofs, 2, _y));
	}
}


surface_reset_target();