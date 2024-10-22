/// @description func run_act():

speed = 0;
if (SUPER > 0 || act_done > 0) { return; }
act_done = sec;
if (sprite_index == spr_fight || sprite_index == spr_yell) {
	audio_play_sound(snd_slash, 10, false);
	//var _killcoll = ds_list_create();
	//var _killcollcount = collision_circle_list(x, y, fight_rad, obj_mon, false, true, _killcoll, false);
	//for (var i=0; i<_killcollcount; i++) { instance_destroy(_killcoll[|i]); }
	//ds_list_destroy(_killcoll);
}
if (sprite_index == spr_act) {
	act_done = 0;
	possible_acts = possible_act_acts;
	act_index = irandom_range(0, array_length(possible_act_acts)-1);
	sprite_index = possible_act_acts[act_index%array_length(possible_act_acts)];
	return;
}
if (sprite_index == spr_item) { soul_heal(player, 2); }
if (sprite_index == spr_mercy) {
	var _p = player;
	with (obj_mon) { instance_destroy(self); count_for_combo(_p, 1); break; }
}
if (sprite_index == spr_bruh) {
	turn_sped = 1;
	if (instance_exists(player)) { player.halarity += 5; }
}
if (sprite_index == spr_yeet) {
	if (instance_exists(player)) {
		with (player) {
			direction = irandom_range(0, 360);
			speed = 70;	
		}
	}
}
if (sprite_index == spr_yellow) {
	if (instance_exists(player)) {
		soulmode_set(player, COLOR_INDEX.YELLOW);
		player.redyellow_timer = player.redyellow_maxtimer;
	}
}
if (sprite_index == spr_color) {
	if (instance_exists(player)) {
		var _soulmode_i = irandom_range(1, 7);
		soulmode_set(player, _soulmode_i);
	}
}