if (draw)
{
	if (surface_exists(surface))
	{
		
	}
	else
	{
		surface_set_target(surface)
		draw_surface(surface, x, y);
	}
}