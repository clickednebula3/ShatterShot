randomise();
global.score = 1;

time_between_spawns = sec/2;
alarm[0] = time_between_spawns;

time_between_fight_checks = 3*sec;
alarm[1] = time_between_fight_checks;

unhandlable_pure_speed = 8;

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