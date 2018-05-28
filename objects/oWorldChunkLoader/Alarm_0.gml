//After 10 frames, the file tries to connect. Obviously, this is an expensive operation, which is why
//we wait 10 frames in case the player is standing on a load zone chunk, or rapidly crosses another.

var _fileString = ""; 
var _file = "";

//The file name has already been assigned on the loader's creation. All we do is check if it exists.
//If not, we load the default error file.
if (file_exists("World/" + chunkFile))
{
	var _file = file_text_open_read("World/" + chunkFile);
}
else
{
	var _file = file_text_open_read("World/X9999Y9999.json");
}
	
	
while (!file_text_eof(_file))
{
	_fileString += file_text_readln(_file);
}
	
chunkInfo = json_decode(_fileString);
file_text_close(_file);

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

