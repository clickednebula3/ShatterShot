if (collision_circle(x, y, (sprite_width+sprite_height)/4, obj_portal, true, true) == noone) {
	x = clamp(x, x-bbox_left-1, room_width-(bbox_right-x)+1);
	y = clamp(y, y-bbox_top-1, room_height-(bbox_bottom-y)+1);
}

var _target_alt = noone;
var _target = noone;
if (instance_exists(obj_redbluehalf)) { _target_alt = instance_nearest(x, y, obj_redbluehalf); if (!_target_alt.visible) { _target_alt = noone; } }
if (instance_exists(obj_player)) { _target = instance_nearest(x, y, obj_player); }

if (!instance_exists(_target) || (instance_exists(_target_alt) && distance_to_object(_target_alt) < distance_to_object(_target)) ) { _target = _target_alt; }

if (distance_to_object(_target) < 64 && instance_exists(purplayer_my_purpellet)) {
	purplayer_my_purpellet.redness++;
}

var _target_coords = [0, 0];
if (instance_exists(_target)) { _target_coords = [_target.x, _target.y]; }

var _nearest_portal = instance_nearest(x, y, obj_portal);
if (instance_exists(_nearest_portal) && instance_exists(_nearest_portal.linked_portal)) {
	var _dist = point_distance(x, y, _nearest_portal.x, _nearest_portal.y);//later add portal_to_orb
	var _shortest_plyr = -1;
	var _shortest_half = -1;
	var _portal_target = noone;
	
	if (instance_exists(obj_player)) {
		var _plyr = instance_nearest(_nearest_portal.x, _nearest_portal.y, obj_player);
		_shortest_plyr = point_distance(_nearest_portal.linked_portal.x, _nearest_portal.linked_portal.y, _plyr.x, _plyr.y);
		_portal_target = _plyr;
	}
	if (instance_exists(obj_redbluehalf)) {
		var _half = instance_nearest(_nearest_portal.x, _nearest_portal.y, obj_redbluehalf);
		if (_half.visible) {
			_shortest_half = point_distance(_nearest_portal.linked_portal.x, _nearest_portal.linked_portal.y, _half.x, _half.y);
			if (_shortest_plyr>=0 && _shortest_half < _shortest_plyr) { _portal_target = _half; }
		}
	}
	
	if (
		instance_exists(_portal_target) &&
		point_distance(x, y, _target_coords[0], _target_coords[1]) > _dist + point_distance(_nearest_portal.linked_portal.x, _nearest_portal.linked_portal.y, _portal_target.x, _portal_target.y
	)) {
		_target_coords = [_nearest_portal.x-dcos(_nearest_portal.image_angle), _nearest_portal.y+dsin(_nearest_portal.image_angle)];
	}
}

if (my_color = c_white)
{
	if (instance_exists(_target)) {
		gravity = 0.15;
		gravity_direction = point_direction(x, y, _target_coords[0], _target_coords[1]);
	} else { gravity = 0; }
	speed *= 0.98;
}
else if (my_color = c_red)
{
	if (instance_exists(_target)) {
		if (abs(_target_coords[1]-y) > abs(_target_coords[0]-x)) {
			y += 2*((_target_coords[1]-y)/abs((_target_coords[1]-y)));
		} else {
			x += 2*((_target_coords[0]-x+0.01)/abs((_target_coords[0]-x)));
		}
	}
	speed *= 0.98;
}
else if (my_color = c_green)
{
	speed = 3;
	var shots_list = ds_list_create();
	var shots_count = collision_circle_list(x, y, 64, obj_shot, false, true, shots_list, true);
	if (shots_count > 0) {
		direction = point_direction(x, y, shots_list[|0].x, shots_list[|0].y);
		if (my_shield <= 0) { direction += 180; }
	}
	ds_list_destroy(shots_list);
	
	if (instance_exists(purplayer_my_purpellet)) { instance_destroy(purplayer_my_purpellet); }
}
else if (my_color = c_yellow)
{
	speed *= 0.98;
	if (instance_exists(_target)) {
		image_angle = point_direction(x, y, _target_coords[0], _target_coords[1])+90;
		direction = image_angle;
		speed = yellow_counterdirectionativity;
		
		if (Time % (sec*3) == sec*3-1) {
			var shot = instance_create_depth(x, y, depth, obj_shot);
			shot.image_angle = image_angle-90;
			shot.direction = image_angle-90;
			shot.owner = self;
		}
		if (Time % (sec*3) >= sec*2.5) { x += irandom_range(-1, 1); y += irandom_range(-1, 1); }
	}
}
else if (my_color = BLUE)
{
	gravity = 1;
	if (Time % (sec*3) == sec*2.5) { gravity_direction += 180; }
	if (Time % (sec*3) == sec*3-1) { gravity_direction = 90*irandom_range(0, 3); }
	if (Time % (sec*3) <= sec*2.5 && Time % (sec*3) >= 2*sec) { x += irandom_range(-1, 1); y += irandom_range(-1, 1); }
	speed *= 0.9;
	image_angle = gravity_direction+90;
	if (instance_exists(_target)) {
		if (gravity_direction%180 == 0) {
			y += ((_target_coords[1]-y)/abs((_target_coords[1]-y)));
		} else {
			x += ((_target_coords[0]-x+0.01)/abs((_target_coords[0]-x)));
		}
	}
}
else if (my_color = c_purple)
{
	
	//find target
	//point initial line
	//find optimal point on the line
	//use regular speed to reach there
	//the next line is always perpendicular
	
	//NEW EDITION:
	
	var interval = sec*3;
	
	//kill main
	if (Time % interval == 1) {
		instance_destroy(purples_strings_makes_them_ring_a);
	}
	//update main
	if (Time % interval == 2 && instance_exists(purples_strings_makes_them_ring_b)) {
		purples_strings_makes_them_ring_a = purples_strings_makes_them_ring_b;
		purples_strings_makes_them_ring_a.image_alpha = 1;
	}
	
	if (instance_exists(_target)) {
		
		//pathfind
		
		
		
		//update side
		if (Time % interval == sec/2) {
		purples_strings_makes_them_ring_b = instance_create_depth(x, y, depth, obj_grapple);
		purples_strings_makes_them_ring_b.direction = point_direction(x, y, _target.x, _target.y);
		if (instance_exists(purples_strings_makes_them_ring_a)) {
			purples_strings_makes_them_ring_b.direction = purples_strings_makes_them_ring_b.direction;
		}
		purples_strings_makes_them_ring_b.image_alpha = 0.2;
		}
		//warn side
		if (Time & interval == sec*2.5 && instance_exists(purples_strings_makes_them_ring_b)) {
			purples_strings_makes_them_ring_b.image_alpha = 0.4;
		}
	}
	
	
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
	
	//OLD EDITION:
	
	//if (Time % (sec*3) == 1) { instance_destroy(purples_strings_makes_them_ring_a);	}
	//if (Time % (sec*3) == 2) {
	//	if (instance_exists(purples_strings_makes_them_ring_b)) {
	//		purples_strings_makes_them_ring_a = purples_strings_makes_them_ring_b;
	//		purples_strings_makes_them_ring_a.image_alpha = 1;
	//	}
	//}
	//var target = self;
	//if (instance_exists(_target)) {
	//	target = _target;
		
	//	if (Time % (sec*3) == sec/2) {
	//		purples_strings_makes_them_ring_b = instance_create_depth(x, y, depth, obj_grapple);
	//		purples_strings_makes_them_ring_b.direction = point_direction(x, y, _target.x, _target.y);
	//		purples_strings_makes_them_ring_b.image_alpha = 0.2;
	//	}
	//	if (Time % (sec*3) == sec*2.5 && instance_exists(purples_strings_makes_them_ring_b))
	//	{ purples_strings_makes_them_ring_b.image_alpha = 0.4; }
		
	//}
	
	//if (instance_exists(purples_strings_makes_them_ring_a)) {//WJHY ISNT THIS WORKING
	//	//make sure that soul is on line
	//	var xs = purples_strings_makes_them_ring_a.xstart;
	//	var ys = purples_strings_makes_them_ring_a.ystart;
	//	var dir = purples_strings_makes_them_ring_a.direction;
	//	//grapple_line			ys = m1*xs + b1
	//	var m1 = -dsin(dir) / dcos(dir);
	//	var b1 = ys - (m1*xs);
	//	//perpendicular_line	yplyr = m2*xplyr + b2
	//	var m2 = -1/m1;
	//	var b2 = target.y - (m2*target.x);
	//	//go to closest point on the grapple line
	//	var new_x = (b2-b1)/(m1-m2);
	//	new_x = clamp(new_x, 8, room_width-8);
	//	var new_y = m1*new_x + b1;
	//	new_y = clamp(new_y, 8, room_height-8);
	//	new_x = (new_y-b2)/m2;
	//	//smooth motion to point on line
	//	x = new_x;
	//	y = new_y;
	//	//x = (12*x + new_x)/13;
	//	//y = (12*y + new_y)/13;
	//}
	
	//speed *= 0.5;
}
else if (my_color = c_aqua)
{
	speed = 3;
	var _pr = orange_points[orange_target_point%array_length(orange_points)];
	direction = point_direction(x, y, _pr[0], _pr[1]);
	if (point_distance(x, y, _pr[0], _pr[1]) < speed*2) {
		orange_target_point++;
		if (orange_target_point >= array_length(orange_points)) { orange_target_point = 0; }
	}
	//if (instance_exists(obj_player)) {
	//	gravity = 0.3;
	//	gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
	//} else { gravity = 0; }
	//speed *= 0.98;
}
else if (my_color = c_orange)
{
	speed = 3;
	var _pr = orange_points[orange_target_point%array_length(orange_points)];
	direction = point_direction(x, y, _pr[0], _pr[1]);
	if (point_distance(x, y, _pr[0], _pr[1]) < speed*2) {
		orange_target_point++;
		if (orange_target_point >= array_length(orange_points)) { orange_target_point = 0; }
	}
	//if (instance_exists(obj_player)) {
	//	gravity = 0.3;
	//	gravity_direction = point_direction(x, y, obj_player.x, obj_player.y);
	//} else { gravity = 0; }
	//speed *= 0.98;
}

Time ++;
//x = clamp(x, 8, room_width-8);
//y = clamp(y, 8, room_height-8);

if (orngplayer_tension <= 0) { instance_destroy(); }