///@description Begin Async File Load
//After 10 frames, the file tries to connect. Obviously, this is an expensive operation, which is why
//we wait 10 frames in case the player is standing on a load zone chunk, or rapidly crosses another.

if (!haltLoad)
{

	
	var _fileString = ""; 
	var _fileName = "World/" + chunkFile;
	var _file = "";
	
	




	//The file name has already been assigned on the loader's creation. All we do is check if it exists.
	//If not, we load the default error file.
	if (file_exists(_fileName))
	{

		_file = file_bin_open(_fileName, 0);
		var _fileSize = file_bin_size(_file);
		dataBuffer = buffer_create(_fileSize, buffer_fixed, 1);
		loadId = buffer_load_async(dataBuffer, _fileName, 0, _fileSize);
		file_bin_close(_file);
		//mClientLogAddEntry("Chunk file connected for chunk load. File is " + _fileName);
	}
	else
	{
	
		_file = file_bin_open(ERROR_CHUNK_FILE, 0);
		var _fileSize = file_bin_size(_file);
		dataBuffer = buffer_create(_fileSize, buffer_fixed, 1);
		loadId = buffer_load_async(dataBuffer, ERROR_CHUNK_FILE, 0, _fileSize);
		file_bin_close(_file);
		//mClientLogAddEntry("Chunk file connected for chunk load. File is generic error chunk.");
	}
}
