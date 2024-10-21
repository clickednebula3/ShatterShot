/// @description spr_FIGHT check

var _red_player_found = noone;
with (obj_player) { if (my_color == c_red) { _red_player_found = self; break; } }

if (instance_exists(_red_player_found) &&
	instance_number(obj_fight) <= _red_player_found.soullevel[? (_red_player_found.possible_colors[COLOR_INDEX.RED]) ]
	)
{
	var _button = instance_create_depth(
		irandom_range(64, room_width-64),
		irandom_range(64, room_height-64),
		50, obj_fight);
	_button.player = _red_player_found;
}

alarm[1] = time_between_fight_checks;