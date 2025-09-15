my_color = c_white;
r = 3;

if (instance_exists(obj_control) && obj_control.hide_xp) { visible = false; }

weight_bag = [
	[c_red, 50],
	[c_yellow, 50],
	[c_white, 100],
	[BLUE, 100],
	[c_aqua, 150],
	[c_orange, 150],
	[c_purple, 100],
	[c_green, 90],
	
];

function get_random_color_from_weight_bag(_weight_bag) {
	var _marble_sum = 0;
	
	for (var i=0; i<array_length(_weight_bag); i++) { _marble_sum += _weight_bag[i][1]; }
	
	var _dice = irandom_range(0, _marble_sum-1);
	var _temp_sum = 0;
	
	for (var i=0; i<array_length(_weight_bag); i++) {
		_temp_sum += _weight_bag[i][1];
		if (_temp_sum > _dice) { return i; }
	}
	
	return -1;
}


my_color = weight_bag[get_random_color_from_weight_bag(weight_bag)][0];
emphasis = false;

//possible_colors = [c_red, c_yellow, c_green, c_purple, BLUE, c_orange, c_aqua, c_white];
//my_color = possible_colors[irandom_range(0, array_length(possible_colors)-1)];

if (instance_exists(obj_player)) {
	direction = point_direction(x, y, obj_player.x, obj_player.y)+180+random_range(-10, 10);
	speed = 10+random_range(-2, 4);//20+random_range(-2, 6);
	
	var _emphasis = false;
	var _col = my_color;
	
	with (obj_player) {
		if (is_array(my_color)) {
			for (var i=0; i<array_length(my_color); i++) { if (my_color[i] == _col) { _emphasis = true; } }
		} else {
			if (my_color == _col) { _emphasis = true; }
		}
	}
	
	emphasis = _emphasis;
	
	if (!emphasis) { image_xscale *= 0.5; image_yscale *= 0.5; image_alpha = 0.3; }
}
