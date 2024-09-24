if (instance_exists(obj_player) && obj_player.my_color == c_purple) {
	draw_set_color(c_white);
	draw_circle(x, y, rad, false);
	draw_set_color(c_purple);
	draw_circle(x, y, rad, true);
}