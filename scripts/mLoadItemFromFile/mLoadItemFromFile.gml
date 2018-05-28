///@description Takes a file and an item. Attempts to treat the file as an item file, load its data, and plug it into the item.
///@arg item - The item to load info into.
///@arg file - The file to read from.

var _item = argument0;
var _fileName = argument1;

_filePath = "Items/" + _fileName;

//Ensure the file exists before we do shitall.
if (file_exists(_filePath))
{
	//Basic stuff for the next several lines. Totally read the file into the _fileString variable.
	var _file = file_text_open_read(_filePath);
	var _fileString = "";
	
	while (!file_text_eof(_file))
	{
		_fileString += file_text_readln(_file);
	}
	
	file_text_close(_file);
	
	//With the file read, we now decode it into a map.
	var _itemMap = json_decode(_fileString);
	
	//And then we start plugging in the expected variable types.
	//todo: expand this for different types of items.
	
	with (_item)
	{
		itemType		= ds_map_find_value(_itemMap, "itemType");
		invWidth		= ds_map_find_value(_itemMap, "width");
		itemHeight		= ds_map_find_value(_itemMap, "height");
		sprite			= ds_map_find_value(_itemMap, "sprite");
		itemFile			= _fileName;
		sprite_index	= asset_get_index(sprite);
	}
	
	ds_map_destroy(_itemMap);
}
