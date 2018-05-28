///@description The parentmost save script.

//THIS SCRIPT IS STILL UNDER HEAVY CONSTRUCTION. PLEASE WEAR A HARD HAT

//First we create the map which will hold all the save data.
var _saveInfo = ds_map_create();

//We'll also need to work with the center chunk a lot.
var _centerChunk = ds_grid_get(oWorldHandler.worldChunks, 1, 1);

ds_map_set(_saveInfo, "worldX", global.worldX);
ds_map_set(_saveInfo, "worldY", global.worldY);
ds_map_set(_saveInfo, "chunkX", oPlayer.x - _centerChunk.x);
ds_map_set(_saveInfo, "chunkY", oPlayer.y - _centerChunk.y);
ds_map_set(_saveInfo, "worldOffsetX", global.worldChunkOffsetX);
ds_map_set(_saveInfo, "worldOffsetY", global.worldChunkOffsetY);












var _string = json_encode(_saveInfo);

var _file = file_text_open_write(working_directory + "sav1.json");
file_text_write_string(_file, _string);
file_text_close(_file);



ds_map_destroy(_saveInfo);