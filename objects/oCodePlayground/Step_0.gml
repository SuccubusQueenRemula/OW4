

for (var i = 0; i < path_get_number(p); i ++)
{
   path_change_point(p, i, path_get_point_x(p, i), path_get_point_y(p, i) + 2, 2);
}