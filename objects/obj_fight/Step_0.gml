if (instance_exists(player) && player.my_color != c_red) { instance_destroy(); return; }

if (act_done > 0) {
	speed = 0;
	act_done--;
	
	if (sprite_index == spr_button_fight || sprite_index == spr_fight || sprite_index == spr_yell) {
		var _killcoll = ds_list_create();
		var percent = power(1-power(((act_done/sec)), 2), 2);
		var _killcollcount = collision_circle_list(x, y, fight_rad*percent, obj_mon, false, true, _killcoll, false);
		for (var i=0; i<_killcollcount; i++) {
			if (_killcoll[|i].my_color = c_green) { soul_heal(player, 1); }
			count_for_combo(player, 1);
			instance_destroy(_killcoll[|i]);
		}
		ds_list_destroy(_killcoll);
		
		var _bosscoll = ds_list_create();
		var _bosscollcount = collision_circle_list(x, y, fight_rad*percent, [obj_myspoke], false, true, _bosscoll, false);
		for (var i=0; i<_bosscollcount; i++) {
			if (instance_exists(_bosscoll[|i]) && !array_contains(_bosscoll[|i].immune_to, self)) {
				_bosscoll[|i].myspoke_hurt(self, 3);
			}
		}
		ds_list_destroy(_bosscoll);
	}
	
	if (act_done == 1) { instance_destroy(); }
	return;
}

if (image_index < 2) { image_index *= 0.94; }
//image_index = 0;
speed += 0.05;
speed *= 0.99;

if (SUPER > 0) {
	SUPER--;
	speed = 9;
	image_index = 4;
	var _coll_mon = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon, true, false);
	if (_coll_mon != noone) { _coll_mon.death_cause = player; instance_destroy(_coll_mon); count_for_combo(player, 1); }
	if (sprite_index == spr_bruh) { turn_sped = 1; }
	var _bosscoll = ds_list_create();
	var _bosscollcount = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, [obj_myspoke], false, true, _bosscoll, false);
	for (var i=0; i<_bosscollcount; i++) {
		if (instance_exists(_bosscoll[|i]) && !array_contains(_bosscoll[|i].immune_to, self))
		{ _bosscoll[|i].myspoke_hurt(self, 3, 0.5); }
	}
	ds_list_destroy(_bosscoll);
}

var top_or_bottom = (bbox_top < 2 || bbox_bottom > room_height-2);
var left_or_right = (bbox_left < 2 || bbox_right > room_width-2);

if (left_or_right && top_or_bottom && !SUPER) {//DVD hitting corner be like: 
	SUPER = 10*sec;
};