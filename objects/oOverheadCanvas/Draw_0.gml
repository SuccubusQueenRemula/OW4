if (draw)
{
	if (!surface_exists(surface))
	{
		mDrawOverheadToSurface();
	}

	//x = owner.x;
	//y = owner.y;
	draw_surface(surface, x, y);
	
}