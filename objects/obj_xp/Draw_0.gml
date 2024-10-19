if (!is_array(my_color)) { draw_set_color(my_color); }
draw_circle(x, y, r, false);
image_xscale = r/16;
image_yscale = r/16;

if (instance_exists(obj_player)) {
	gravity = 1;
	gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
	speed *= 0.95;
} else { gravity = 0; }