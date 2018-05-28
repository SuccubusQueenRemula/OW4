///@description Draws all of a chunk's terrain to its surface for later use. Called during a chunk's load and any time the surface is lost.

//Ensure the surface exists.
if (!surface_exists(terrainSurface))
{
	terrainSurface = surface_create(global.chunkWidth, global.chunkHeight);
}

surface_set_target(terrainSurface);

//Now we loop through all of the tiles in this world chunk and draw them onto the surface.
var _gridHeight = ds_grid_height(tileGrid);
var _gridWidth = ds_grid_width(tileGrid);
var _y = 0;
var _x = 0;
var _sprite = noone;

for (_y = 0; _y < _gridHeight; _y++)
{
	_x = 0;
	for (_x = 0; _x < _gridWidth; _x++)
	{
		//...and draw them.
		_sprite = ds_grid_get(tileGrid, _x, _y);
		//To determine where in the room to draw it, we use a few variables:
		//Its position in its chunk's grid, that chunk's position in the world grid, and current offsets.
		if (sprite_exists(_sprite))
		{
			draw_sprite(_sprite, 0, 64 * _x, 64 * _y);
		}
	}
}

surface_reset_target();