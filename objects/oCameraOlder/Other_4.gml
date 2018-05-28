if (instance_exists(target))
{
	x = target.x;
	y = target.y;
	camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2)
}