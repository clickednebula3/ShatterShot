alarm[0] = 3*sec;
global.possible_colors = [
	c_white, c_white,
	c_aqua, c_orange,
	c_red, c_red,
	c_yellow, c_yellow,
	c_purple, c_purple,
	c_blue, c_green
];
my_color = global.possible_colors[irandom_range(0, array_length(global.possible_colors)-1)];
image_alpha = 0.7;