enum OBST_COLOR {
	RED = 0,//red blue soul
	YELLOW = 1,//explode
	GREEN = 2,//
	PURPLE = 3,//
	
	BLUE_ = 4,//platform; no dmg
	ORANGE = 5,//m- move through those ones!!!
	AQUA = 6,//<yellow>blue stop signs</yellow>
	WHITE = 7,//just hit
}

possible_colors = [c_red, c_yellow, c_green, c_purple, BLUE, c_orange, c_aqua, c_white];
my_color = possible_colors[OBST_COLOR.WHITE];
content = noone;
warning_still_there = true;
owner = noone;
f = 1;

alarm[0] = 10*sec;