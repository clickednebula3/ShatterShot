if (!is_array(my_color)) { draw_set_color(my_color); }
draw_set_alpha(image_alpha);
draw_circle(x, y, r*2, false);
image_xscale = (0.5+2.5*emphasis)*2*r/16;
image_yscale = (0.5+2.5*emphasis)*2*r/16;
draw_set_alpha(1);

if (instance_exists(obj_player) && point_distance(x, y, obj_player.x, obj_player.y) < 80) {
	gravity = 0.3;
	gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
	speed *= 0.95;
} else { gravity = 0; speed *= 0.7; }
//speed *= 0.5;