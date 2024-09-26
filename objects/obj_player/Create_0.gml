spd = 2;
HP = 3;
MAX_HP = 10;
color_index = COLOR_INDEX.RED;
possible_colors = [c_red, c_yellow, c_green, c_purple, c_blue, c_orange, c_aqua, c_white];
my_color = possible_colors[color_index%array_length(possible_colors)];

//aqua and orange
//gravitation or smth to player

player_id = 0;
controller_index = 0;
uses_mouse = false;

green_allround_shield = false;
orange_dropped_pin = [room_width/2, room_height/2];
aqua_move_meter = 2*sec;
aqua_stunned = false;
aqua_parry_rad = 64;
purple_string_gap = 32;
purple_string_x = 0;//loop in (0 to gap);
purple_string_y = 0;
green_shield = noone;
green_shield_cooldown = 0;
green_shield_cooldown_max = 5*sec;

redyellow_maxtimer = 12*sec;
redyellow_timer = -1;
bigshottery = 0;
bigshottery_max = sec;
halarity = 0;
cayote_time_for_speed_max = 0.5*sec;
cayote_time_for_speed = 0;

function soulmode_set(_set_to) {
	color_index = _set_to%array_length(possible_colors);
	if (_set_to != COLOR_INDEX.RED) { instance_destroy(obj_fight); }
	obj_player.alarm[3] = sec;
}

function soulmode_jump(_jump_by = 1) {
	color_index += _jump_by;
	color_index = color_index%array_length(possible_colors);
	if (_jump_by != COLOR_INDEX.RED) { instance_destroy(obj_fight); }
	obj_player.alarm[3] = sec;
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
		my_death_particle.my_color = my_color;
		instance_destroy();
	}
}

function count_my_shots(me = self) {
	var shots = 0;
	with (obj_shot) { if (owner == me) { shots++; } }
	return shots;
}

//Movement
//	purple: 2d strings (that move too?)
//  yellow,red,orange,aqua,green: simple 4-direction
//	yellow+: point to mouse
//	white: gravitation to mouse
//  blue: gravitate to walls

//Attack
//	white,blue: speediness dash
//  red: attack from battle menu (like flowey fight)
//	aqua: ??????????????????? / time your z_press when in other souls' tension zone
//	orange: ??????????????????? / linger in other soul's tension zone for a while
//  yellow: for his nutrual special he weilds: a gun
//	purple: ???????????????????
//  green: only defends and aggressively deflects

//Swap Order
//Red -> Yellow -> Green -> Purple -> Blue -> Orange -> Aqua
//Red: [Yellow Button]
//Yellow: Hit Target
//Green:
//Purple:
//Blue:
//Orange:
//Aqua:




