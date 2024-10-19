// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr__main__(){

}

function stun_soul(soul) { soul.aqua_stunned = true; soul.aqua_move_meter = -sec/2; }

function soul_save_game(soul)
{
	soul.alarm[2] = sec;
	game_save("save"+string(soul.player_id)+".txt");
	soul.alarm[1] = sec;
	soul.alarm[2] = 0;
}
	
function soulmode_set(soul, _set_to) {
	soul.color_index = _set_to%array_length(soul.possible_colors);
	if (_set_to != COLOR_INDEX.RED) { instance_destroy(obj_fight); }
	soul.alarm[3] = sec;
}

function soulmode_jump(soul, _jump_by = 1) {
	soul.color_index += _jump_by;
	soul.color_index = soul.color_index%array_length(soul.possible_colors);
	if (_jump_by != COLOR_INDEX.RED) { instance_destroy(obj_fight); }
	soul.alarm[3] = sec;
}

function soul_hit(killtarget = noone) {
	if (alarm[0] <= 0 && cayote_time_for_speed <= 0) {
		HP--;
		HP = clamp(HP, 0, 10);
		if (instance_exists(killtarget)) { instance_destroy(killtarget); }
		alarm[0] = 2*sec;
		if (HP > 0) { audio_play_sound(snd_dmg, 10, false, 1, 0, 1+random_range(-0.1, 0.1)); }
	}
	if (HP <= 0) {
		var my_death_particle = instance_create_depth(x, y, depth, obj_mon_break);
		my_death_particle.image_angle = image_angle+90;
		if (is_array(my_color)) {
			my_death_particle.my_color = my_color[0];
			my_death_particle.half_soul_mode = 1+(x >= redbluehalf.x);
			var my_death_particle2 = instance_create_depth(redbluehalf.x, redbluehalf.y, depth, obj_mon_break);
			my_death_particle2.image_angle = image_angle+90;
			my_death_particle2.my_color = my_color[1];
			my_death_particle2.half_soul_mode = 1+(x < redbluehalf.x);
			instance_destroy(redbluehalf);
		} else { my_death_particle.my_color = my_color; }
		instance_destroy();
	}
}

function count_my_shots(soul = self) {
	var shots = 0;
	with (obj_shot) { if (owner == soul) { shots++; } }
	return shots;
}