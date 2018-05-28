jsonMap = ds_map_create();

ds_map_set(jsonMap, "width", 1);
ds_map_set(jsonMap, "height", 1);
ds_map_set(jsonMap, "sprite", sprite_get_name(sPotion));
ds_map_set(jsonMap, "itemType", "potion");

var _string = json_encode(jsonMap);
var _file = file_text_open_write("testItem.json");
file_text_write_string(_file, _string);
file_text_close(_file);


ds_map_destroy(jsonMap);
game_end();