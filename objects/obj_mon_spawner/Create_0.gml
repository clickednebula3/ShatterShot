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


weight_bag = [
	//[c_purple, 10000, 3*sec],
	[c_red, 100, 3*sec],
	[c_green, 40, 3*sec],
	[c_aqua, 60, 30*sec], [c_orange, 60, 30*sec],
	
	[c_purple, 100, 50*sec],
	[c_yellow, 100, 70*sec],
	[c_blue, 100, 100*sec],
	[c_white, 100, 140*sec],
	
	[c_yellow, 200, 200*sec],
	[c_white, 200, 200*sec],
	[c_green, 100, 200*sec],
];

function get_random_soulmon(time_counter) {
	var _weight_bag = [];
	var _marble_sum = 0;
	
	for (var i=0; i<array_length(weight_bag); i++) {
		if (weight_bag[i][2] <= time_counter)
		{ array_push(_weight_bag, weight_bag[i]); _marble_sum += weight_bag[i][1]; }
		else { break; }
	}
	
	if (_marble_sum <= 0) { return noone; }
	
	var _chosen_marble = irandom_range(0, _marble_sum-1);
	var _marble_pile = 0;
	for (var i=0; i<array_length(_weight_bag); i++) {
		_marble_pile += _weight_bag[i][1];
		if (_marble_pile >= _chosen_marble) { return _weight_bag[i][0]; }
	}
	
	return noone;
}

time_between_spawns_max = 3.8*sec;
time_between_spawns_min = 1*sec;
time_between_spawns_width = 400*sec;
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