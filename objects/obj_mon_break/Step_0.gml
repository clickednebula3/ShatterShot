if (half_soul_mode > 0) { image_index = 5+half_soul_mode; }
if (alarm[0] > 0) {
	x = x + random_range(-1, 1);
	y = y + random_range(-1, 1);
}
else if (alarm[1] > 0) {
	image_index = 1;
	if (half_soul_mode > 0) { image_index = 5+half_soul_mode; }
}
else if (alarm[2] > 0) {
	gravity_direction = 270;
	gravity = 1;
	speed *= 0.96;
}