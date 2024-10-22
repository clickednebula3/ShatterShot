randomise();
global.score = 1;

time_between_spawns = sec/2;
alarm[0] = time_between_spawns;

time_between_fight_checks = 3*sec;
alarm[1] = time_between_fight_checks;

unhandlable_pure_speed = 8;

//green
//red
//orange - aqua
//purple
//yellow
//blue
//white

enum WEIGHT_SUMMONEE_DATA {
	COLOR = 0,
	WEIGHT = 1,
	AVAILABLE_AFTER = 2,
	PATCH_SIZE = 3,
}

weight_bag = [
	//[c_purple, 10000, 3*sec],
	//[color, weight, available_after_time, patch[min, max], ]
	[c_red, 100, 3*sec, [1, 3]], [c_green, 100, 3*sec, [1, 2]],
	[c_aqua, 60, 30*sec, [1, 1]], [c_orange, 60, 30*sec, [1, 1]],
	
	[c_purple, 100, 50*sec, [2, 2]],
	[c_yellow, 100, 100*sec, [1, 1]],
	[c_blue, 200, 170*sec, [1, 1]],
	[c_white, 200, 250*sec, [1, 1]],
	
	[c_yellow, 200, 300*sec, [1, 2]], [c_white, 200, 300*sec, [1, 2]], [c_green, 100, 300*sec, [1, 1]],
];

function get_weight_bag_data(time_counter) {
	var _weight_bag = [];
	var _marble_sum = 0;
	
	for (var i=0; i<array_length(weight_bag); i++) {
		if (weight_bag[i][WEIGHT_SUMMONEE_DATA.AVAILABLE_AFTER] <= time_counter)
		{ array_push(_weight_bag, weight_bag[i]); _marble_sum += weight_bag[i][WEIGHT_SUMMONEE_DATA.WEIGHT]; }
		else { break; }
	}
	
	return [_weight_bag, _marble_sum];
}

function get_random_soulmon_data(time_counter) {
	var _weight_bag_data = get_weight_bag_data(time_counter);
	var _weight_bag = _weight_bag_data[0];
	var _marble_sum = _weight_bag_data[1];
	
	if (_marble_sum <= 0) { return -1; }
	
	var _chosen_marble = irandom_range(0, _marble_sum-1);
	var _marble_pile = 0;
	for (var i=0; i<array_length(_weight_bag); i++) {
		_marble_pile += _weight_bag[i][1];
		if (_marble_pile >= _chosen_marble) { return _weight_bag[i]; }
	}
	
	return -1;
}

time_between_spawns_max = 3.8*sec;
time_between_spawns_min = 0.4*sec;
time_between_spawns_width = 600*sec;
time_between_spawns_now = time_between_spawns_max;
time_counter = 0;

wave_index = 0;
wave_summonee_index = 0;
waves = [//the amount of a color is just the number of it in the field? (or weight)
	//red&green
	[c_red],
	[c_yellow],//test
	[c_red, c_green],
	[c_red, c_red, c_red, c_green],
	[c_red, c_red, c_red, c_green],
	//white did I do wrong? just light me have some fun!
	[c_white],
	[c_red, c_red, c_white],
	[c_red, c_white, c_green],
	//bravary&patience
	[c_orange, c_aqua, c_green],
	[c_red, c_orange, c_aqua],
	[c_white, c_orange, c_aqua, c_green],
	[c_red, c_orange, c_aqua, c_white], //the classic 4
	//introducing blue
	[c_blue, c_blue],
	[c_blue, c_blue, c_blue, c_red, c_green],
	[c_blue, c_blue, c_blue, c_white, c_white],
	[c_orange, c_aqua, c_blue, c_blue],
	//double intro purple&yellow
	[c_purple, c_yellow, c_green],
	[c_purple, c_yellow, c_red],
	[c_purple, c_yellow, c_blue, c_blue], //the quirky 3
	[c_purple, c_orange, c_aqua, c_green],
	//the versus (any good matchings)
	[c_orange, c_orange, c_orange, c_green],
	[c_aqua, c_aqua, c_aqua, c_yellow],
	[c_red, c_orange, c_aqua, c_white],
	[c_yellow, c_yellow, c_yellow],
	[c_green, c_white, c_blue, c_blue],
	[c_blue, c_blue, c_purple, c_purple],
	[c_green, c_green, c_yellow, c_yellow, c_blue, c_blue],
	[c_green, c_red, c_white, c_orange, c_aqua],
	[c_yellow, c_purple, c_white, c_red],
	[c_yellow, c_purple, c_white, c_red, c_blue],
	[c_yellow, c_purple, c_blue, c_blue, c_blue],
	[c_yellow, c_purple, c_purple, c_white, c_white],
	[c_red, c_white, c_aqua, c_orange, c_blue, c_blue],
	[c_green, c_green],
	[c_yellow, c_yellow, c_yellow, c_yellow, c_yellow, c_yellow, c_green, c_green, c_green],
	[c_blue, c_blue, c_blue, c_purple, c_purple, c_purple],
	[c_green, c_white, c_white, c_white, c_red, c_red],
	[c_blue, c_yellow, c_purple, c_orange, c_orange],
	[c_orange, c_orange, c_orange, c_aqua, c_aqua, c_aqua, c_green, c_green],
	[c_green, c_green, c_green, c_green, c_green, c_green, c_green, c_green],
	[c_red, c_white, c_yellow, c_orange, c_aqua, c_blue, c_purple],
	[c_red, c_white, c_yellow, c_orange, c_aqua, c_blue, c_purple],
	[c_red, c_white, c_yellow, c_orange, c_aqua, c_blue, c_purple, c_green],//just keep looping this onwards
	[c_red, c_white, c_yellow, c_orange, c_aqua, c_blue, c_purple, c_green, c_red, c_white, c_yellow, c_orange, c_aqua, c_blue, c_purple, c_green],
]