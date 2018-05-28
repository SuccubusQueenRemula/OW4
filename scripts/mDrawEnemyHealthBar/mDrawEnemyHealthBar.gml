///@arg currentHealth
///@arg maxHealth
///@arg nameDisplayed
///@arg factionDisplayed

var _currentHealth = argument0;
var _maxHealth = argument1;
var _name = argument2;
var _faction = argument3;

//First, determine what 10% of the GUI width is.
var _guiBuffer = round(display_get_gui_width()/10);
//This should be the width of the bar, leaving a 5% buffer on each side.
var _barWidth = round(display_get_gui_width() - _guiBuffer);
//Now, we determine what percentage of health this fellow has remaining. 1 is 100%, .5 is 50%, etc.
var _remainingHealth = _currentHealth/_maxHealth;



draw_set_color(c_red);
//Based on everything, draw the healthbar
draw_sprite_ext(sHealthGradient, 0, _guiBuffer / 2, 10, (_barWidth * _remainingHealth), 1, 0, c_white, 1);


//Draw the enemy name centered on the healthbar
var _stringWidth = string_width(_name);
var _stringHeight = string_height(_name);
var _barWidthHalf = _barWidth / 2;
var _barHeightHalf = 15;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_text(_barWidthHalf + _guiBuffer / 2, _barHeightHalf + 10, _name);


