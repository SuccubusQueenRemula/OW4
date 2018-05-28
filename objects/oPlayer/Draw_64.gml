if (drawInv)
{
	with (actorInventory)
	{
		var _h = ds_grid_height(inv);
		var _w = ds_grid_width(inv);
		var _y = 0;
		var _x = 0;
		var _value = noone;
		
		for (_y = 0; _y < _h; _y++)
		{
			for (_x = 0; _x < _w; _x++)
			{
				_value = ds_grid_get(inv, _x, _y);
				//Backdrop of rect.
				var _left = 0 + (_x * 16);
				var _top = 0 + (_y * 16);
				draw_set_color(c_black);
				draw_rectangle(_left, _top, _left + 16, _top + 16, false);
				//Outline
				draw_set_color(c_white);
				draw_rectangle(_left, _top, _left + 16, _top + 16, true);
			}
		}
	}
}