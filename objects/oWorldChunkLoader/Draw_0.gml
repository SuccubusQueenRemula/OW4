
//This is the frame we tell the loading chunk to save its terrain to a surface.
if (applySurface)
{
	
	with (loadingWorldChunk)
	{
		draw = true;
		mDrawTerrainToSurface();
		
	}
	
	with (loadingWorldChunk.overheadCanvas)
	{
		draw = true;
		mDrawOverheadToSurface();
	}
	
	with (loadingWorldChunk.overheadParallaxCanvas)
	{
		draw = true;
		mDrawOverheadParallaxToSurface();
	}

	
	applySurface = false;
}