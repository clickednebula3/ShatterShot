my_color = c_yellow;
Time = 0;
my_shield = 3;
cant_move = false;
death_cause = noone;

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

function best_point_on_line(lx, ly, ldir, tx, ty) {
	var m1 = -dsin(ldir) / dcos(ldir);
	var b1 = ly - (m1*lx);
	//perpendicular_line	yplyr = m2*xplyr + b2
	var m2 = -1/m1;
	var b2 = ty - (m2*tx);
	//go to closest point on the grapple line
	var new_x = (b2-b1)/(m1-m2);
	var new_y = m1*new_x + b1;
	//smooth motion to point on line
	return [new_x, new_y];
}

var m = darctan((orange_points[1][1]-orange_points[0][1])/(orange_points[1][0]-orange_points[0][0]));
var p = best_point_on_line(orange_points[0][0], orange_points[0][1], m, orange_points[2][0], orange_points[2][1]);
m += 90 * (2*irandom_range(0, 1)-1);
p[0] += dcos(m)*random_range(orange_distance/3, orange_distance);
p[1] -= dsin(m)*random_range(orange_distance/3, orange_distance);
orange_points[2] = p;

orange_target_point = 0;
orange_timer = 3*sec;
orange_on = false;

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
	
//function best_point_on_line(lx, ly, ldir, tx, ty) {
//	var m1 = -dsin(ldir) / dcos(ldir);
//	var b1 = ly - (m1*lx);
//	//perpendicular_line	yplyr = m2*xplyr + b2
//	var m2 = -1/m1;
//	var b2 = ty - (m2*tx);
//	//go to closest point on the grapple line
//	var new_x = (b2-b1)/(m1-m2);
//	var new_y = m1*new_x + b1;
//	//smooth motion to point on line
//	return [new_x, new_y];
//}
	
function percent_inator(_a, _b, _percent) { return _a + _percent*(_b-_a); }