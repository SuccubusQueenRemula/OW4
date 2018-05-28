//After 10 frames, the file tries to connect. Obviously, this is an expensive operation, which is why
//we wait 10 frames in case the player is standing on a load zone chunk, or rapidly crosses another.


if (file_exists(chunkFile))
{
	var _fileString = ""; 
	var _file = file_text_open_read(chunkFile);
	while (!file_text_eof(_file))
	{
		_fileString += file_text_readln(_file);
	}
	
	chunkInfo = json_decode(_fileString);
	file_text_close(_file);
}
//The chunkInfo variable now holds a map that is all of the chunk's info.