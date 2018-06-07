
//This is the frame we tell the loading chunk to save its terrain to a surface.
if (applySurface)
{
	
	with (loadingWorldChunk)
	{
		draw = true;
		mDrawTerrainToSurface();
		
	}

	
	applySurface = false;
}