//var _rcx = oRoomCenter.x;
//var _rcy = oRoomCenter.y;
//var _vw = view_wport[view_current];
//var _vh = view_hport[view_current];

//if (instance_exists(oRoomCenter))
//{
//	camera_set_view_pos(view_get_camera(view_current), _rcx, _rcy);
//	exit;
//}

//if (!instance_exists(target))
//{
//	exit;
//}

//x = lerp(x, target.x, .1);
//y = lerp(y, target.y - 8, .1);
//x = mRoundToN(x, 1/scale);
//y = mRoundToN(y, 1/scale);

camera_set_view_pos(view_camera[0], rWidthCenter - width / 2, rHeightCenter - height / 2);
//x = clamp(x, width/2, room_width-width/2);
//y = clamp(y, height/2, room_height-height/2);
//camera_set_view_pos(view_camera[0], rWidthCenter - width / 2, rHeightCenter - height / 2);