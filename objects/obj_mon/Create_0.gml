my_color = c_yellow;
Time = 0;
my_shield = 3;

yellow_counterdirectionativity = 2*irandom_range(0, 1) - 1;

purples_strings_makes_them_ring_a = noone;
purples_strings_makes_them_ring_b = noone;
direction = irandom_range(0, 360);

orange_distance = 125;
orange_points = [
	[xstart, ystart],
	[
		clamp(irandom_range(64, room_width-64), xstart-orange_distance, xstart+orange_distance),
		clamp(irandom_range(64, room_height-64), ystart-orange_distance, ystart+orange_distance),
	],
	[
		clamp(irandom_range(64, room_width-64), xstart-orange_distance, xstart+orange_distance),
		clamp(irandom_range(64, room_height-64), ystart-orange_distance, ystart+orange_distance),
	],
];
orange_target_point = 0;

orngplayer_tension_max = sec;
orngplayer_tension = sec;
orngplayer_radius = 2*64/3;
purplayer_my_purpellet = instance_create_depth(
	irandom_range(64, room_width-64), irandom_range(64, room_height-64), depth, obj_purpellet);
purplayer_my_purpellet.owner = self;

//white: gravitate towards target
//red: Just Move Bro
//blue: gravitate towards wall, can jump and change walls
//yellow: big shot, slides on one of the walls
//purple: strings attatched (maybe works like a grappling hook, so you can only move after you spiderman a string where you want to go)
//green: shield in selected direction (can't move??)
//light green: healing!
//light blue: don't move through it
//orange: move through those ones!!