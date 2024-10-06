if (my_color = c_blue) {
	if (bbox_left < 0 || bbox_right > room_width) {
		gravity_direction = point_direction(0, 0, hspeed, 0);
	} else {
		gravity_direction = point_direction(0, 0, 0, vspeed);
	}
	if (bbox_left < 0 || bbox_right > room_width) {hspeed *= -0.5;}
	if (bbox_top < 0 || bbox_bottom > room_height) {vspeed *= -0.5;}
	x = clamp(x, x-bbox_left, room_width-(bbox_right-x));
	y = clamp(y, y-bbox_top, room_height-(bbox_bottom-y));
	return;
} else if (my_color == c_purple) {
	soul_hit();
	return;
}

if (bbox_left < 0 || bbox_right > room_width) { hspeed *= -1; }
if (bbox_top < 0 || bbox_bottom > room_height) { vspeed *= -1; }