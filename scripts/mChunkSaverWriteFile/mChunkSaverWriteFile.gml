//@description Writes a chunk to a file. To be called by oWorldChunkSaver.

var _mapString = json_encode(chunkInfo);
 
var _file = file_text_open_write(working_directory + "/" + "World" +  "/" + "X" + chunkX + "Y" + chunkY + CHUNK_FILE_EXT);
file_text_write_string(_file, _mapString);
file_text_close(_file);