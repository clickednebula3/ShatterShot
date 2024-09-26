/// @description spr_FIGHT check

var _red_player_found = false;
with (obj_player) { if (my_color == c_red) { _red_player_found = true; break; } }

if (_red_player_found && !instance_exists(obj_fight))
{
	instance_create_depth(
		irandom_range(64, room_width-64),
		irandom_range(64, room_height-64),
		50, obj_fight);
}

alarm[1] = time_between_fight_checks;