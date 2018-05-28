event_inherited();

//This is a top border. It must be stretched to fit across a chunk. 
//It's y was, by default, that of the center chunk. Fix that.
y = y - sprite_height;
image_xscale = (global.chunkWidth / sprite_get_width(sprite_index));