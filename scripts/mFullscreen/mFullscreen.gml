

//with (oCamera)
//{
//	camera_set_view_size(view_camera[0], 1920, 1080);
//	target = oPlayer;

//	width = camera_get_view_width(view_camera[0]);
//	height = camera_get_view_height(view_camera[0]);
//	rWidthCenter = room_width / 2;
//	rHeightCenter = room_height / 2;


//	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2);


//	scale = view_wport[0] / width;
//}

//I think this one is obvious.

//We must also resize the GUI to match the new window size.

var _camWidth = camera_get_view_width(view_camera[0]);
var _camHeight = camera_get_view_height(view_camera[0]);
var _monWidth = display_get_width();
var _monHeight = display_get_height();

var _heightDiff = abs(_monWidth - _camWidth);
var _widthDiff = abs(_monHeight - _camHeight);

var _multiplier = 0;
if (_heightDiff > _widthDiff)
{
	_multiplier = _monHeight / _camHeight;
	var _newHeight = _camHeight * _multiplier;
	var _newWidth = _camWidth * _multiplier;
}

else
{
	_multiplier = _monWidth / _camWidth;
	var _newHeight = _camHeight * _multiplier;
	var _newWidth = _camWidth * _multiplier;
}
camera_set_view_size(view_camera[0], _newWidth, _newHeight);








//original 
window_set_fullscreen(true);
display_set_gui_size(window_get_width(), window_get_height());