/// @description spr_FIGHT check

if (instance_exists(obj_player) && obj_player.my_color == c_red && !instance_exists(obj_fight))
{
	instance_create_depth(
		irandom_range(64, room_width-64),
		irandom_range(64, room_height-64),
		50, obj_fight);
}

alarm[1] = time_between_fight_checks;