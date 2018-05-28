//This surface contains a picture of all the terrain.

if (!surface_exists(terrainSurface))
{
	terrainSurface = surface_create(global.chunkWidth, global.chunkHeight);
}