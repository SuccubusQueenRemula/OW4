///@description Given a center chunk x and y coordinate, loads the world grid around it.
///@arg xCoord - The x coordinate of the chunk.
///@arg yCoord - The y coordinate of the chunk.

//The coordinates of the world chunk to load.
var _chunkX = argument0;
var _chunkY = argument1;

//The current concatenation of the file name for the loading chunk.
var _fileX = "";
var _fileY = "";

//This is the center chunk, so it will be the one the player is standing upon. 
global.worldX = _chunkX;
global.worldY = _chunkY;

//This is what will be used for the file connection
var _file = noone;

//The text of the file to connect to.
var _fileString = "";

//The chunk currently being worked on.
var _chunk = noone;




with (oWorldHandler)
{

	var _w = ds_grid_width(worldChunks);
	var _h = ds_grid_height(worldChunks);
	
	//We use these for loops to fill the grid with world chunks.
	for (var _y = 0; _y < _h; _y++)
	{
		for (var _x = 0; _x < _w; _x++)
		{
			//Use the loop iterator and given center chunk to concatenate a file name.
			var _chidPrefix = mConcatChidPrefix(_x - 1 + _chunkX, _y - 1 + _chunkY);
			var _fileNamePath = mConcatChunkFilePathUsingChid(_chidPrefix);
			_fileString = "";
			
			//Connect to the file if it exists. If not, connect to the error chunk file.
			if (file_exists(_fileNamePath))
			{
				_file = file_text_open_read(_fileNamePath);
			}
			else
			{
				_file = file_text_open_read(ERROR_CHUNK_FILE);
			}
			
			//We are now connected to a chunk file. Let's load the text into memory, then close the file.
			while (!file_text_eof(_file))
			{
				_fileString += file_text_readln(_file);
			}
			file_text_close(_file);
			
			//Now we can create the chunk and add it to the grid.
			_chunk = instance_create_depth(global.chunkWidth * (_x - 1), global.chunkHeight * (_y - 1), 16000, oWorldChunk);
			ds_grid_set(worldChunks, _x, _y, _chunk);
			
			//Assign the chunk to the proper coordinates.
			var _xx = global.worldChunkOffsetX + ((_x - 1) * global.chunkWidth);
			_chunk.x = _xx;
			var _yy = global.worldChunkOffsetY + ((_y - 1) * global.chunkHeight);
			_chunk.y = _yy;
			
			//Now, with the chunk created, we use the loaded file information to make correctly load all info for it.
			var _chunkInfo = json_decode(_fileString);
			mPopulateWorldChunk(_chunk, _chunk.x, _chunk.y, _chunkInfo, _chidPrefix);
			ds_map_destroy(_chunkInfo);
			
			//Get a changelist for this chunk.
			var _cl = mChangeListFindOrCreate(_chunkX - _x - 1, _chunkY - _y - 1);
			
			with (_cl)
			{
				mChangeListApplyChanges(_chunk);
			}
			
		}
	}
	
	//Now with all chunks loaded, we apply borders to the center one.
	mCreateWorldChunkBorders(ds_grid_get(worldChunks, 1, 1));

}