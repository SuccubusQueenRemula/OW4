//The world chunks are arranged in a 3x3 grid.
worldChunks = ds_grid_create(3, 3);

depth = 15000;


mLoadWorldAtCenterChunk(10, 10);



//var _i = 0;
//var _j = 0;
//var _iterator = 0;
//var _sprite = noone;
//var _chunk = noone;
//var _worldChunk = noone;

//var _fullFileName = "";
//var _file = "";
//var _fileString = "";

//var _chunkInfo = noone;

//global.worldX = _starterChunkX;
//global.worldY = _starterChunkY;

////Fill the grid with world chunks.
//for (_i = 0; _i <  _gridHeight; _i++)
//{
//	for (_j = 0; _j < _gridWidth; _j++)
//	{
//		//First, we concatenate the file name.
//		_fileX = string(_j - 1 + _starterChunkX);
//		_fileY = string(_i - 1 + _starterChunkY);
//		_fullFileName = "X" + _fileX + "Y" + _fileY + ".json";
//		_fileString = "";
		
//		//Grab the appropriate file name.
//		if (file_exists("World/" + _fullFileName))
//		{
//			_file = file_text_open_read("World/" + _fullFileName);
//		}
//		//If somehow that file name doesn't exist, we just load the default error chunk.
//		else
//		{
//			_file = file_text_open_read(ERROR_CHUNK_FILE);
//		}
				
//			while (!file_text_eof(_file))
//			{
//				_fileString += file_text_readln(_file);
//			}
			
//			_worldChunk = instance_create_depth(global.chunkWidth * (_j - 1), global.chunkHeight * (_i - 1), 16000, oWorldChunk)
//			ds_grid_add(worldChunks, _j, _i, _worldChunk);

//			//Assign the chunk to the proper coordinates in the world.
			
			
//			var _chunkInfo = "";
//			_chunkInfo = json_decode(_fileString);
//			file_text_close(_file);
			
			
//			mPopulateWorldChunk(_worldChunk, _worldChunk.x, _worldChunk.y, _chunkInfo, _fullFileName);
			
//			ds_map_destroy(_chunkInfo);
		
		
		
		
//		//Create the chunk's borders.
//		mCreateWorldChunkBorders(_worldChunk);
//	}
//}

////_worldChunk = instance_create_depth(x, y, 16000, oWorldChunk)
////		ds_grid_add(worldChunks, _j, _i, _worldChunk);

////		//Assign the chunk to the proper coordinates in the world.
////		var _xx = global.worldChunkOffsetX + ((_j - 1) * global.chunkWidth);
////		_worldChunk.x = _xx;
////		var _yy = global.worldChunkOffsetY + ((_i - 1) * global.chunkHeight);
////		_worldChunk.y = _yy;	






////Fill each chunk of the world grid with different tiles.
////for (_i = 0; _i <  _gridHeight; _i++)
////{
////	for (_j = 0; _j < _gridWidth; _j++)
////	{
////		//Assign a set of tiles to each chunk.
////		switch (_iterator % 4)
////		{
////			case 0:
////				_sprite = sTestGrass;
////				break;
////			case 1:
////				_sprite = sTestDirt;
////				break;
////			case 2:
////				_sprite = sTestSnow;
////				break;
////			case 3:
////				_sprite = sTestSand;
////				break;
////		}
////		_iterator++;
////		mFillWorldChunk(ds_grid_get(worldChunks, _j, _i), _sprite);
////	}
////}