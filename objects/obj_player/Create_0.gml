#macro BLUE		make_color_rgb(82, 82, 230)

audio_play_sound(mus_loyalprotector, 10, true, 1, 0, 0.8);

spd = 2;
HP = 2;
MAX_HP = 5;
color_index = COLOR_INDEX.RED;
possible_colors = [c_red, c_yellow, c_green, c_purple, BLUE, c_orange, c_aqua, c_white, [c_red, c_aqua], [c_aqua, c_orange], c_lime];
my_color = possible_colors[color_index%array_length(possible_colors)];

soulscore_before_level_up = 16;
soulscore = ds_map_create();
soullevel = ds_map_create();
for (var i=0; i < array_length(possible_colors); i++) { ds_map_set(soullevel, possible_colors[i], 0); }

//aqua and orange
//gravitation or smth to player

player_id = 0;
controller_index = 0;
uses_mouse = false;

depth-=9999999;

combo_timer = 0;
combo_timer_max = 1*sec;
combo = 0;

white_grapple = noone;
white_grapple_cooldown = 0;
white_grapple_cooldown_max = 1*sec;
redbluehalf = instance_create_depth(x, y, depth+2, obj_redbluehalf);
redbluehalf.visible = false;
redbluehalf.owner = self;
redbluehalf.active = false;
redbluelaser = 0;
green_allround_shield = false;
orange_dropped_pin = [room_width/2, room_height/2];
aqua_move_meter = 2*sec;
aqua_stunned = false;
aqua_parry_rad = 64;
purple_string_gap = 48;//32
purple_string_gap_reasonable = 32;
purple_string_x = 0;//loop in (0 to gap);
purple_string_y = 0;
green_shield = noone;
green_shield_cooldown = 0;
green_shield_cooldown_max = 3*sec;
green_defshield = instance_create_depth(x, y, depth+1, obj_defshield);
green_defshield.owner = self;
portal_stun = 0;

redyellow_maxtimer = 12*sec;
redyellow_timer = -1;
bigshottery = 0;
bigshottery_max = sec;
halarity = 0;
cayote_time_for_speed_max = 0.5*sec;
cayote_time_for_speed = 0;

function attempt_levelup() {
	for (var i=0; i < array_length(possible_colors); i++) {
		var _col = possible_colors[i];
		var _xp = ds_map_find_value(soulscore, _col);
		if (_xp >= soulscore_before_level_up) {
			ds_map_set(soulscore, _col, _xp - soulscore_before_level_up);
			ds_map_set(soullevel, _col, ds_map_find_value(soullevel, _col)+1);
		}
	}
}

//Movement
//	purple: 2d strings (that move too?)
//  yellow,red,orange,aqua,green: simple 4-direction
//	yellow+: point to mouse
//	white: grapple
//  blue: gravitate to walls

//Attack
//  white: grapple hit
//	blue: speediness dash
//  red: attack from battle menu (like flowey fight)
//	aqua: ??????????????????? / time your z_press when in other souls' tension zone
//	orange: ??????????????????? / linger in other soul's tension zone for a while
//  yellow: for his nutrual special he weilds: a gun
//	purple: ???????????????????
//  green: only defends and aggressively deflects

//Levelup
//  red: more buttons || faster move speed
//  yellow: more shots || faster big shot
//  aqua: more range || faster reload
//  orange: more slots || faster reload
//  purple: chance of more pellets (per mon) || gravity pellets when nearby
//  green: larger shield || quick reload time || 
//  blue: 
//  white: 
//  redblue: 
//  portal: 

//Swap Order
//Red -> Yellow -> Green -> Purple -> Blue -> Orange -> Aqua
//Red: [Yellow Button]
//Yellow: Hit Target
//Green:
//Purple:
//Blue:
//Orange:
//Aqua:




