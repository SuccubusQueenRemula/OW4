///@arg portaitSprite

var _portraitSprite = argument0;

var _guiHeight = display_get_gui_height();
var _guiWidth = display_get_gui_width();

var _picWidth = sprite_get_width(sPortraitBack);
var _picHeight = sprite_get_height(sPortraitBack);
var _cornerWidth = sprite_get_width(sPortraitFrameUpLeft);
var _cornerHeight = sprite_get_height(sPortraitFrameUpLeft);

var _barWidth = _picWidth - (_cornerWidth * 2);
var _barHeight =  _picHeight - (_cornerHeight * 2);

var _picDrawPosY = _guiHeight - 10 - _picHeight;
var _picDrawPosX = 10;

draw_sprite(sPortraitBack, 0, _picDrawPosX, _picDrawPosY);


draw_sprite(sPortraitFrameUpRight, 0, _picDrawPosX + _cornerWidth + _barWidth, _picDrawPosY);
draw_sprite_ext(sPortraitFrameVer, 0, _picDrawPosX + _cornerWidth + _barWidth + _cornerWidth - sprite_get_width(sPortraitFrameVer), _picDrawPosY + _cornerHeight, 1, _barHeight, 0, c_white, 1);
draw_sprite_ext(sPortraitFrameHor, 0, _picDrawPosX + _cornerWidth, _picDrawPosY, _barWidth, 1, 0, c_white, 1);

var _portHeight = sprite_get_height(_portraitSprite);
var _heightDiff = _portHeight - _picHeight;
draw_sprite(_portraitSprite, 0, _picDrawPosX, _picDrawPosY - _heightDiff);
draw_sprite(sPortraitFrameUpLeft, 0, _picDrawPosX, _picDrawPosY);

draw_sprite(sPortraitFrameBottomRight, 0, _picDrawPosX + _cornerWidth + _barWidth, _picDrawPosY + _cornerHeight + _barHeight);

draw_sprite_ext(sPortraitFrameVer, 0, _picDrawPosX, _picDrawPosY + _cornerHeight, 1, _barHeight, 0, c_white, 1);
draw_sprite(sPortraitFrameBottomLeft, 0, _picDrawPosX, _picDrawPosY + _cornerHeight + _barHeight);
draw_sprite_ext(sPortraitFrameHor, 0, _picDrawPosX + _cornerWidth, _picDrawPosY + (_cornerHeight * 2) + _barHeight - sprite_get_height(sPortraitFrameHor), _barWidth, 1, 0, c_white, 1);
