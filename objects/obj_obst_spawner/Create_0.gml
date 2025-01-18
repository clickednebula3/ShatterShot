randomise();

enum OBST_SPAWN_WEIGHT_DATA {
	TITLE = 0,
	WEIGHT = 1,
	AVAILABLE_AFTER = 2,
	TIME_TILL_NEXT_SPAWN = 3,
}

enum OBSTACLE {
	NONE_HAPPY_BREAK_TIME,
	CUBE_A,
	CUBE_B,
	CUBE_C,
	LASER_A,
	LASER_B,
	LASER_C,
	BOSS_MYSPOKE,
}

weight_bag = [
	//case-specific title, weight, available_after_time, time_till_next_spawn
	//do not change titles without changing them in draw event
	[OBSTACLE.NONE_HAPPY_BREAK_TIME, 100, 2*sec, 5*sec],
	[OBSTACLE.CUBE_A, 100, 10*sec, 5*sec],
	[OBSTACLE.CUBE_B, 100, 30*sec, 5*sec],
	[OBSTACLE.CUBE_C, 100, 45*sec, 5*sec],
	[OBSTACLE.LASER_A, 100, 70*sec, 10*sec],
	[OBSTACLE.LASER_B, 100, 150*sec, 10*sec],
	[OBSTACLE.LASER_C, 100, 100*sec, 10*sec],
	[OBSTACLE.BOSS_MYSPOKE, 30, 300*sec, 30*sec],
];
current_obst_id = -1;

time_counter = 0;
time_till_next_spawn = 3*sec;

function summon_basic_cube() {
	var _i = irandom_range(0, 3);
	var _cube = instance_create_depth(room_width, room_height/2, depth, obj_obst);
	_cube.image_xscale = 4;
	_cube.image_yscale = 4;
	if (_i == 0) { _cube.hspeed = -3; _cube.x = room_width+360; _cube.y = random_range(128, room_height-128); }
	if (_i == 1) { _cube.vspeed = -3; _cube.x = random_range(128, room_width-128); _cube.y = room_height+240; }
	if (_i == 2) { _cube.hspeed = 3; _cube.x = -360; _cube.y = random_range(128, room_height-128); }
	if (_i == 3) { _cube.vspeed = 3; _cube.x = random_range(128, room_width-128); _cube.y = -240; }
	return _cube;
}

function get_weight_bag_data(time_counter) {
	var _weight_bag = [];
	var _marble_sum = 0;
	
	for (var i=0; i<array_length(weight_bag); i++) {
		if (weight_bag[i][OBST_SPAWN_WEIGHT_DATA.AVAILABLE_AFTER] <= time_counter)
		{ array_push(_weight_bag, weight_bag[i]); _marble_sum += weight_bag[i][OBST_SPAWN_WEIGHT_DATA.WEIGHT]; }
		//no break cuz they not in order
	}
	
	return [_weight_bag, _marble_sum];
}

function get_random_obst_data(time_counter) {
	var _weight_bag_data = get_weight_bag_data(time_counter);
	var _weight_bag = _weight_bag_data[0];
	var _marble_sum = _weight_bag_data[1];
	
	if (_marble_sum <= 0) { return -1; }
	
	var _chosen_marble = irandom_range(0, _marble_sum-1);
	var _marble_pile = 0;
	for (var i=0; i<array_length(_weight_bag); i++) {
		_marble_pile += _weight_bag[i][1];
		if (_marble_pile >= _chosen_marble) { return i; }
	}
	
	return -1;
}