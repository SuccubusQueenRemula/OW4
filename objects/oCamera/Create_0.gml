target = oPlayer;

width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);
rWidthCenter = room_width / 2;
rHeightCenter = room_height / 2;


camera_set_view_pos(view_camera[0], rWidthCenter - width / 2, rHeightCenter - height / 2);


scale = view_wport[0] / width;
