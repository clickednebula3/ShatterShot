if (act_done > 0) {
	speed = 0;
	act_done--;
	
	if (sprite_index == spr_fight || sprite_index == spr_yell) {
		var _killcoll = ds_list_create();
		var percent = power(1-power(((act_done/sec)), 2), 2);
		var _killcollcount = collision_circle_list(x, y, fight_rad*percent, obj_mon, false, true, _killcoll, false);
		for (var i=0; i<_killcollcount; i++) { instance_destroy(_killcoll[|i]); }
		ds_list_destroy(_killcoll);
	}
	
	if (act_done == 1)
	{ instance_destroy(); }
	return;
}

sprite_index = possible_acts[act_index%array_length(possible_acts)];
image_index *= 0.94;
//image_index = 0;
speed += 3;
speed *= 0.5;

if (SUPER > 0) {
	SUPER--;
	speed = 9;
	image_index = 2;
	var _coll_mon = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mon, true, false);
	if (_coll_mon != noone) { instance_destroy(_coll_mon); }
	if (sprite_index == spr_bruh) {
		turn_sped = 1;
	}
}

var top_or_bottom = (bbox_top < 2 || bbox_bottom > room_height-2);
var left_or_right = (bbox_left < 2 || bbox_right > room_width-2);

if (left_or_right && top_or_bottom) {//DVD hitting corner be like: 
	SUPER = 10*sec;
};

if (instance_exists(obj_player) && obj_player.my_color != c_red) { instance_destroy(); }