///@description Draws all of a chunk's terrain to its surface for later use. Called during a chunk's load and any time the surface is lost.

//Ensure the surface exists.
if (!surface_exists(terrainSurface))
{
	terrainSurface = surface_create(global.chunkWidth, global.chunkHeight);
}

surface_set_target(terrainSurface);

//Now we loop through all of the tiles in this world chunk and draw them onto the surface.
var _tilesH = ds_grid_height(tileGrid);
var _tilesW = ds_grid_width(tileGrid);
var _wallsH = ds_grid_height(terrainWalls);
var _y, _x, _sprite;

for (_y = 0; _y < _tilesH; _y++)
{
	for (_x = 0; _x < _tilesW; _x++)
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

//Now do the same thing for the walls. The walls only need to go by height.
for (_y = 0; _y < _wallsH; _y++)
{
	_sprite = ds_grid_get(terrainWalls, 0, _y);
	
	if (sprite_exists(_sprite))
	{
		//TODO: Fix magic numbers.
		draw_sprite(_sprite, 0, ds_grid_get(terrainWalls, 1, _y), ds_grid_get(terrainWalls, 2, _y));
	}
}


surface_reset_target();