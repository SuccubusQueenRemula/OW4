if instance_exists(oDrawable)
{
	if (ds_exists(depthGrid, ds_type_grid))
	{
		//--RESIZE GRID AND PREP LOCAL VARS---
		var _depthGrid = depthGrid;
		var _instNum = instance_number(oDrawable);
		ds_grid_resize(_depthGrid, 2, _instNum);
		var _i = 0;
		
		
		
		//---ADD ALL TO GRID---
		with (oDrawable)
		{
			if (visible)
			{
				//Add our ID to the left column of the grid.
				_depthGrid[# 0, _i] = id;
				//Add our Y coordinate to the right column of the grid.
				_depthGrid[# 1, _i] = y;
				//Increase index
				_i++;
			}
			
		}
	
		//---SORT AND DRAW---
		//Everything is in the grid now. Let's sort it!
		ds_grid_sort(depthGrid, 1, true);
	
		_i = 0;
		repeat(_instNum)
		{
			var _inst = depthGrid[# 0, _i]
			with (_inst)
			{
				if (object_is_ancestor(_inst.object_index, oActor) && sprite_exists(sprite_index))
				{
					draw_self();
			    	gpu_set_blendenable(false);
					gpu_set_colorwriteenable(false, false, false, true);
					draw_set_alpha(0);
				
					#region Determine UpperLeftCorner
					if (sprite_width % 2 == 0)
					{
						var _x = x - sprite_xoffset;
					}
					else
					{
						var _x = x - sprite_xoffset - 1;
					}
				
					if (sprite_height % 2 == 0)
					{
						var _y = y - sprite_yoffset;
					}
					else
					{
						var _y = y - sprite_yoffset - 1;
					}
					#endregion DetermineUpperLeftCorner
				
					draw_rectangle(_x, _y, _x + sprite_width, _y + sprite_height, false);
				
					draw_set_alpha(1);
					gpu_set_colorwriteenable(true, true, true, true);
					gpu_set_blendenable(true);
				
				
				}
				else
				{
					if (sprite_exists(sprite_index))
					{
						draw_self();
					}
				}
			}
			_i++;
		}
	
		ds_grid_clear(depthGrid, 0);
	}
}