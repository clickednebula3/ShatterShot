if (alarm[0] > 0) {
	x = xstart + random_range(-1, 1);
	y = ystart + random_range(-1, 1);
}
else if (alarm[1] > 0) {
	image_index = 1;
}
else if (alarm[2] > 0) {
	gravity_direction = 270;
	gravity = 1;
	speed *= 0.96;
}