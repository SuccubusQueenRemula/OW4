///@description Draws all of an overhead parallaxs' canvas' sprites to its surface for later use. Called during a chunk's load and any time the surface is lost.

//Ensure the surface exists.
if (!surface_exists(surface))
{
	surface = surface_create(global.chunkWidth * 2, global.chunkHeight * 2);
}

surface_set_target(surface);

var _y = 0;
var _sprite = noone;
var _paraH = ds_grid_height(parallaxGrid);


//Now do the same thing for the edges. The walls only need to go by height.
for (_y = 0; _y < _paraH; _y++)
{
	_sprite = ds_grid_get(parallaxGrid, 0, _y);
	
	if (sprite_exists(_sprite))
	{
		//TODO: Fix magic numbers.
		draw_sprite(_sprite, 0, ds_grid_get(parallaxGrid, 1, _y), ds_grid_get(parallaxGrid, 2, _y));
	}
}


surface_reset_target();