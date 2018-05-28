/// @description Insert description here
// You can write your code in this editor

var _x = 100;
var _y = 100;
var _w = sprite_get_width(sPortraitFrameUpLeft);
var _h = sprite_get_height(sPortraitFrameHor);
draw_sprite(sPortraitFrameUpLeft, 0, _x, _y);
draw_sprite(sPortraitFrameHor, 0, _x + _w, _y);

//ORIGINAL DRAW CODE



///// @description Insert description here
//// You can write your code in this editor
//if (currentHealth <= 0)
//{
//	shader_set(gGreyscale);
//	draw_self();
//	////draw_surface(application_surface, application_surface.x, application_surface.y);
//	shader_reset();
//}

//else
//{
//	draw_self();
//}