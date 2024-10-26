/// @description Fade In
var mon = instance_create_depth(x, y, depth, obj_mon);
mon.my_color = my_color;

if (orange_points != -1) { mon.orange_points = orange_points; }
if (orange_target_point != -1) { mon.orange_target_point = orange_target_point; }

instance_destroy();