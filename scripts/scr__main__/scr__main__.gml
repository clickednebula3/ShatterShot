// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr__main__(){

}

function prevent_boundary_escape(object) {
	if (collision_circle(object.x, object.y, (object.sprite_width+object.sprite_height)/4, obj_portal, true, true) != noone) { return; }
	
	if (object.object_index == obj_player) {
		if (object.my_color = BLUE) {
			if (object.bbox_left < 0 || bbox_right > room_width)
			{ gravity_direction = point_direction(0, 0, hspeed, 0); }
			else { gravity_direction = point_direction(0, 0, 0, vspeed); }
			if (bbox_left < 0 || bbox_right > room_width) {hspeed *= -0.5;}
			if (bbox_top < 0 || bbox_bottom > room_height) {vspeed *= -0.5;}
			x = clamp(x, x-bbox_left, room_width-(bbox_right-x));
			y = clamp(y, y-bbox_top, room_height-(bbox_bottom-y));
			return;
		} else if (my_color == c_purple) {
			soul_hit();
			return;
		}
	}

	if (bbox_left < 0 || bbox_right > room_width) { hspeed *= -1; }
	if (bbox_top < 0 || bbox_bottom > room_height) { vspeed *= -1; }
}

function count_for_combo(soul, count) {
	if (instance_exists(soul) && soul.object_index == obj_player) {
		soul.combo += count;
		soul.combo_timer = soul.combo_timer_max;
	}
}

function soul_heal(soul, HP) {
	if (instance_exists(soul) && soul.object_index == obj_player) {
		soul.HP += HP;
		audio_play_sound(snd_heal, 10, false);
	}
}

function stun_soul(soul) { soul.aqua_stunned = true; soul.aqua_move_meter = -sec/2; }

function soul_save_game(soul)
{
	soul.alarm[2] = sec;
	show_debug_message("a");
	game_save("save.txt");
	show_debug_message("b");
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

function soul_hit(killtarget = noone, hitpoints = 1, karma = false) {
	if (alarm[0] <= 0 && cayote_time_for_speed <= 0) {
		HP-=hitpoints;
		HP = clamp(HP, 0, 10);
		if (instance_exists(killtarget)) { instance_destroy(killtarget); }
		if (!karma) { alarm[0] = 2*sec; }
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