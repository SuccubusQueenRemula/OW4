if (draw)
{
	if (!surface_exists(surface))
	{
		mDrawOverheadToSurface();
	}

	draw_surface(surface, x, y);
	
}