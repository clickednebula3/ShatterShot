draw_set_alpha(0.3);
draw_set_color(my_color);

var _target = noone;
if (instance_exists(obj_player)) { _target = instance_nearest(x, y, obj_player); }

if (my_color == c_red || my_color == c_white) {
	draw_arrow(x, y, x + 16*(x-xprevious), y + 16*(y-yprevious), 4);
}
if (my_color == c_yellow && instance_exists(_target)) {
	draw_circle(_target.x, _target.y, point_distance(x, y, _target.x, _target.y), true);
}

if (my_color == c_green) {
	draw_sprite_ext(spr_shield, 0, x, y, image_xscale, image_yscale, direction, c_white, my_shield/3);
}

if (my_color == c_orange || my_color == c_aqua) {
	draw_triangle(
		orange_points[0][0], orange_points[0][1],
		orange_points[1][0], orange_points[1][1],
		orange_points[2][0], orange_points[2][1], true);
	
	draw_set_alpha(0.3);
	//draw_triangle(
	//	x+orngplayer_radius*dcos(Time), y+orngplayer_radius*-dsin(Time),
	//	x+orngplayer_radius*dcos(Time+120), y+orngplayer_radius*-dsin(Time+120),
	//	x+orngplayer_radius*dcos(Time+240), y+orngplayer_radius*-dsin(Time+240), true);
	draw_circle(x, y, orngplayer_radius, true);
		
	draw_set_alpha(0.1);
	var _coll = collision_circle(x, y, orngplayer_radius, _target, false, false);
	if (_coll != noone) {
		draw_set_alpha(0.2);
		var _plyr_moved = (abs(_coll.x-_coll.xprevious)>0.1||abs(_coll.y-_coll.yprevious)>0.1);
		if ((my_color == c_orange && _plyr_moved) || (my_color == c_aqua && !_plyr_moved))
		{ orngplayer_tension-= 3 + 5*(my_color == c_blue); }
	}
	
	var percent = 1-(orngplayer_tension/orngplayer_tension_max);
	draw_circle(x, y, orngplayer_radius*percent, false);
	//draw_triangle(
	//	x+percent*orngplayer_radius*dcos(Time), y+percent*orngplayer_radius*-dsin(Time),
	//	x+percent*orngplayer_radius*dcos(Time+120), y+percent*orngplayer_radius*-dsin(Time+120),
	//	x+percent*orngplayer_radius*dcos(Time+240), y+percent*orngplayer_radius*-dsin(Time+240), false);
}

//reset settings
draw_set_alpha(1);
draw_set_color(c_white);

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, my_color, image_alpha);

if (!instance_exists(purplayer_my_purpellet)) {
	draw_set_color(c_white);
	draw_circle(x, y, 2.5, false);
	draw_set_color(c_purple);
	draw_circle(x, y, 2.5, true);
}