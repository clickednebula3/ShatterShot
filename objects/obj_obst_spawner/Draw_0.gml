if (!obj_control.game_started || obj_control.game_paused) { return; }

//if (current_obst_id >= 0) {
//	//play out live obstacles
//	if (time_till_next_spawn > sec/2) {
//		draw_set_color(c_white);
//		draw_text(room_width/3, room_height/6, weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE]);
//	}
//}

time_counter++;
if (time_till_next_spawn > 0) { time_till_next_spawn--; return; }
current_obst_id = get_random_obst_data(time_counter);
if (current_obst_id < 0) { return; }
time_till_next_spawn = weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TIME_TILL_NEXT_SPAWN];



if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.CUBE_WHITE) {
	var _cube = summon_basic_cube();
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.CUBE_DROP) {
	var _cube = summon_basic_cube();
	_cube.my_color = BLUE;
	_cube.image_xscale *= 2;
	_cube.image_yscale *= 2;
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.LASER_A) {
	var _i = irandom_range(0, 3);
	var _laser = noone;
	if (_i == 0) { _laser = instance_create_depth(0, random_range(64, room_height-64), depth, obj_laser); }
	else if (_i == 1) { _laser = instance_create_depth(random_range(64, room_width-64), room_height, depth, obj_laser); }
	else if (_i == 2) { _laser = instance_create_depth(room_width, random_range(64, room_height-64), depth, obj_laser); }
	else if (_i == 3) { _laser = instance_create_depth(random_range(64, room_width-64), 0, depth, obj_laser); }
	if (instance_exists(_laser)) {
		_laser.image_angle = (_i*90)+random_range(-30, 30);
		_laser.alarm[1] = 3*sec;
		_laser.alarm[2] = 20*sec;
		_laser.movement_type = LASER_MOVEMENT.SINE;
	}
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.LASER_B) {
	var _possible_colors = [c_orange, c_aqua];
	var _color = _possible_colors[irandom_range(0, array_length(_possible_colors)-1)];
	var _cube = summon_basic_cube();
	_cube.my_color = _color;
	var _i = irandom_range(0, 3);
	var _r = (_cube.bbox_right-_cube.bbox_left)/2;
	var _laser = instance_create_depth(_cube.x+_r*dcos(90*_i), _cube.y-_r*dsin(90*_i), depth, obj_laser);
	_laser.image_angle = 90*_i;
	_laser.direction = _cube.direction;
	_laser.speed = _cube.speed;
	_laser.my_color = _color;
	array_push(_laser.immune_objects, _cube);
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.LASER_C) {
	var _i = irandom_range(0, 3);
	var _laser = noone;
	if (_i == 0) { _laser = instance_create_depth(0, random_range(64, room_height-64), depth, obj_laser); }
	else if (_i == 1) { _laser = instance_create_depth(random_range(64, room_width-64), room_height, depth, obj_laser); }
	else if (_i == 2) { _laser = instance_create_depth(room_width, random_range(64, room_height-64), depth, obj_laser); }
	else if (_i == 3) { _laser = instance_create_depth(random_range(64, room_width-64), 0, depth, obj_laser); }
	if (instance_exists(_laser)) {
		_laser.image_angle = (_i*90)+random_range(-30, 30);
		_laser.alarm[1] = 3*sec;
		_laser.alarm[2] = 10*sec;
		_laser.movement_type = LASER_MOVEMENT.SINE;
	}
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.BOSS_MYSPOKE) {
	var _cube = summon_basic_cube();
	_cube.content = obj_myspoke;
	_cube.my_color = c_red;
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.CUBE_MOTION_FREEZE) {
	var _cube = summon_basic_cube();
	var _i = irandom_range(0, 1);
	if (_i) { _cube.my_color = c_aqua; } else { _cube.my_color = c_orange; }
}
else if (weight_bag[current_obst_id][OBST_SPAWN_WEIGHT_DATA.TITLE] == OBSTACLE.CUBE_WHITE_STRETCHED) {
	var _cube = summon_basic_cube();
	var _i = irandom_range(0, 1);
	if (_i) { _cube.image_xscale *= 0.5; _cube.image_yscale *= 2; }
	else { _cube.image_yscale *= 0.5; _cube.image_xscale *= 2; }
}


