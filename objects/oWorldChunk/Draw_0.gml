//This surface contains a picture of all the terrain.


if (draw)
{

	if (!surface_exists(terrainSurface))
	{
		mDrawTerrainToSurface();
	}
					
	draw_surface(terrainSurface, x, y);

}

if (global.debugMode)
{
	draw_rectangle(x, y, x + 20, y + 20, false);
}