wave_index = min(wave_index, array_length(waves)-1);
if (wave_summonee_index < array_length(waves[wave_index])) {
	var summonee = instance_create_depth(
		random_range(64, room_width-64), random_range(64, room_height-64),
		depth, obj_mon_spawn);
	var summonee_color = waves[wave_index][wave_summonee_index];
	summonee.my_color = summonee_color;
	wave_summonee_index++;
}

if (!instance_exists(obj_mon) && !instance_exists(obj_mon_spawn)) {
	wave_index++;
	wave_summonee_index = 0;
}


//time_between_spawns = clamp(time_between_spawns-1, 20, time_between_spawns);
alarm[0] = time_between_spawns;
if (keyboard_check_direct(vk_shift)) { alarm[0] = 1; }