/// @description func run_act():

speed = 0;
if (SUPER > 0 || act_done > 0) { return; }
act_done = sec;
if (sprite_index == spr_fight || sprite_index == spr_yell) {
	//var _killcoll = ds_list_create();
	//var _killcollcount = collision_circle_list(x, y, fight_rad, obj_mon, false, true, _killcoll, false);
	//for (var i=0; i<_killcollcount; i++) { instance_destroy(_killcoll[|i]); }
	//ds_list_destroy(_killcoll);
}
if (sprite_index == spr_act) {
	act_done = -1;
	possible_acts = possible_act_acts;
	act_index = irandom_range(0, array_length(possible_act_acts)-1);
	return;
}
if (sprite_index == spr_item) {
	if (instance_exists(obj_player)) { obj_player.HP+=2; }
}
if (sprite_index == spr_mercy) {
	if (instance_exists(obj_mon)) {
		with (obj_mon) { instance_destroy(self); break; }
	}
}
if (sprite_index == spr_bruh) {
	turn_sped = 1;
	if (instance_exists(obj_player)) { obj_player.halarity += 5;}
}
if (sprite_index == spr_yeet) {
	if (instance_exists(obj_player)) {
		with (obj_player) {
			direction = irandom_range(0, 360);
			speed = 70;	
		}
	}
}
if (sprite_index == spr_yellow) {
	if (instance_exists(obj_player)) {
		obj_player.soulmode_set(COLOR_INDEX.YELLOW);
		obj_player.redyellow_timer = obj_player.redyellow_maxtimer;
	}
}
if (sprite_index == spr_color) {
	if (instance_exists(obj_player)) {
		var _soulmode_i = irandom_range(1, 7);
		obj_player.soulmode_set(_soulmode_i);
	}
}