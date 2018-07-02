//If the load process has already been cancelled, we don't want to do this at all.
if (buffer_exists(dataBuffer))
{
	//Multiple async files might be loading at once. We want to make sure we got the one for THIS chunk.
	//Luckily, we stored the value and this event returns the value too, we just check if the two match.
	var _loadId = ds_map_find_value(async_load, "id");
	var _status = ds_map_find_value(async_load, "status");

	if (_loadId == loadId)
	{
		if (_status == false)
		{
			mClientLogAddEntry("WARNING: Async Buffer Load returned with failed status.");
		}
		else
		{
			var _fileString = buffer_read(dataBuffer, buffer_string);		
			chunkInfo = json_decode(_fileString);
		
			//Extrapolate the xCoord and yCoord of the chunk.
			var _w = ds_grid_width(oWorldHandler.worldChunks);
			var _h = ds_grid_height(oWorldHandler.worldChunks);
			var _value = noone;
	
			for (var _y = 0; _y < _h; _y++)
			{
				for (var _x = 0; _x < _w; _x++)
				{
					_value = ds_grid_get(oWorldHandler.worldChunks, _x, _y);
			
					if (_value == id)
					{
			
						xCoord = global.worldX + (_x - 1);
						yCoord = global.worldY + (_y - 1);
						loadingWorldChunk.xCoord = xCoord;
						loadingWorldChunk.yCoord = yCoord;
					}
				}
			}
		
			alarm[1] = 5;
			alarm[2] = 10;
			alarm[3] = 15;
			alarm[4] = 20;
		}
	}
}