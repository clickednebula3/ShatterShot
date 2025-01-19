alarm[0] = 3*sec;
possible_colors = [
	c_white, c_white,
	c_aqua, c_orange,
	c_red, c_red,
	c_yellow, c_yellow,
	c_purple, c_purple,
	BLUE, c_green
];
my_color = possible_colors[irandom_range(0, array_length(possible_colors)-1)];
image_alpha = 0.7;

orange_points = -1;
orange_target_point = -1;