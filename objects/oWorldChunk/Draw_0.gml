//This surface contains a picture of all the terrain.


if (draw)
{

	if (!surface_exists(terrainSurface))
	{
		mDrawTerrainToSurface();
	}
					
	draw_surface(terrainSurface, x, y);

}