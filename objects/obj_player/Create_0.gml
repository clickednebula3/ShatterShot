spd = 2;
HP = 3;
MAX_HP = 10;
color_index = COLOR_INDEX.RED;
possible_colors = [c_red, c_yellow, c_green, c_purple, c_blue, c_orange, c_aqua, c_white, [c_red, c_aqua]];
my_color = possible_colors[color_index%array_length(possible_colors)];
soulscore = ds_map_create();

//aqua and orange
//gravitation or smth to player

player_id = 0;
controller_index = 0;
uses_mouse = false;

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
purple_string_gap = 32;
purple_string_x = 0;//loop in (0 to gap);
purple_string_y = 0;
green_shield = noone;
green_shield_cooldown = 0;
green_shield_cooldown_max = 3*sec;

redyellow_maxtimer = 12*sec;
redyellow_timer = -1;
bigshottery = 0;
bigshottery_max = sec;
halarity = 0;
cayote_time_for_speed_max = 0.5*sec;
cayote_time_for_speed = 0;

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

//Swap Order
//Red -> Yellow -> Green -> Purple -> Blue -> Orange -> Aqua
//Red: [Yellow Button]
//Yellow: Hit Target
//Green:
//Purple:
//Blue:
//Orange:
//Aqua:




