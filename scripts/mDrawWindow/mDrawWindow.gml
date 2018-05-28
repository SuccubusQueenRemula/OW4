///@arg windowX - The X position of the window, topleft
///@arg windowY - The Y position of the window, topleft
///@arg winW - The width of the window.
///@arg winH - The height of the window.
///@arg content - The text to draw.
///@arg background - Bool. Whether to draw the background.

var _winX = argument0;
var _winY = argument1;
var _winW = argument2;
var _winH = argument3;
var _bg = argument4;

var _spriteW = sprite_get_width(sPortraitFrameUpLeft);
var _spriteH = sprite_get_height(sPortraitFrameUpLeft);

//The bar will be the overall size of the portrait (height or width), minus the corners.
var _barW = _winW - _spriteW - _spriteW;
var _barH = _winH - _spriteH - _spriteH;

if (_bg)
{
	draw_set_color(c_black);
	draw_rectangle(_winX + 8, _winY + 8, _winX + _winW - 8, _winY + _winH - 8, false);
}

//Draw corners.
draw_sprite(sPortraitFrameUpLeft, 0, _winX, _winY);
draw_sprite(sPortraitFrameUpRight, 0, _winX + _spriteW + _barW, _winY);
draw_sprite(sPortraitFrameBottomRight, 0, _winX + _spriteW + _barW, _winY + _spriteH + _barH);
draw_sprite(sPortraitFrameBottomLeft, 0, _winX, _winY + _spriteH + _barH);

//Draw sides
//Top bar
draw_sprite_ext(sPortraitFrameHor, 0, _winX + _spriteW, _winY, _barW, 1, 0, c_white, 1);
//Bottom
draw_sprite_ext(sPortraitFrameHor, 0, _winX + _spriteW, _winY + _winH - sprite_get_height(sPortraitFrameHor), _barW, 1, 0, c_white, 1);
//Left
draw_sprite_ext(sPortraitFrameVer, 0, _winX, _winY + _spriteH, 1, _barH, 0, c_white, 1);
//Right
draw_sprite_ext(sPortraitFrameVer, 0, _winX + _winW - sprite_get_width(sPortraitFrameVer), _winY + _spriteH, 1, _barH, 0, c_white, 1);