var _x = x+hspeed;
var _y = y+vspeed;
var _ang = image_angle;
if (movement_type == LASER_MOVEMENT.SINE) { _ang = image_angle + 15*dsin(timer_counter); }
if (alarm[2] > 0) { best_i = clamp(best_i+16, 0, i_count*(min(alarm[2], sec)/sec)); }
else { best_i = clamp(best_i+16, 0, i_count); }
var _best_i = 0;

var _portal_cooldown = 0;

draw_set_color(c_red);
draw_circle(x, y, 2, false);

if (alarm[1] > 0) {
	for (var i=0; i<best_i; i++) {
		var _n_x = _x + i_len * dcos(_ang);
		var _n_y = _y - i_len * dsin(_ang);
	
		_n_x = clamp(_n_x, 0, room_width-1);
		_n_y = clamp(_n_y, 0, room_height-1);
	
		if (point_distance(_x, _y, _n_x, _n_y) > 5*i_len) { break; }
		
		draw_set_color(c_red);
		draw_set_alpha(0.5+0.2*dsin(10*timer_counter));
		if (my_color == c_white) { draw_line_width(_x, _y, _n_x, _n_y, 2.5); }
		else { draw_line_width(_x, _y, _n_x, _n_y, 16); }
	
		var _coll_hit = collision_line(_x, _y, _n_x, _n_y, all, true, true);
	
		_x = _n_x;
		_y = _n_y;
	
		if (_x <= 0 || _x >= room_width-1 || _y <= 0 || _y >= room_height-1) { break; }
	
		if (_portal_cooldown > 0) { _portal_cooldown--; }
		_best_i++;
	}
}
else {
	for (var i=0; i<best_i; i++) {
		var _n_x = _x + i_len * dcos(_ang);
		var _n_y = _y - i_len * dsin(_ang);
	
		_n_x = clamp(_n_x, 0, room_width-1);
		_n_y = clamp(_n_y, 0, room_height-1);
	
		if (point_distance(_x, _y, _n_x, _n_y) > 5*i_len) { break; }
		var _percent = 0.7+0.3*dsin(2*timer_counter)*abs(dsin(2*timer_counter));
		draw_set_alpha(_percent);
		if (my_color == c_white) {
			draw_set_color(c_red);
			draw_line_width(_x, _y, _n_x, _n_y, 4);
			draw_set_color(c_yellow);
			draw_line_width(_x, _y, _n_x, _n_y, 1.5);
		} else {
			draw_set_color(my_color);
			draw_line_width(_x, _y, _n_x, _n_y, 16);
		}
	
		var _coll_hit = collision_line(_x, _y, _n_x, _n_y, all, true, true);
	
		_x = _n_x;
		_y = _n_y;
	
		if (_x <= 0 || _x >= room_width-1 || _y <= 0 || _y >= room_height-1) { break; }
	
		if (_percent > 0.4 && instance_exists(_coll_hit) && !array_contains(immune_objects, _coll_hit)) {
			if (_coll_hit.object_index == obj_portal && _portal_cooldown <= 0 && instance_exists(_coll_hit.linked_portal)) {
				var _d = point_distance(_coll_hit.x, _coll_hit.y, _n_x, _n_y);
				var _ang2 = point_direction(_coll_hit.x, _coll_hit.y, _x, _y)-_coll_hit.image_angle+_coll_hit.linked_portal.image_angle;
				_x = _coll_hit.linked_portal.x + _d*dcos(_ang2);
				_y = _coll_hit.linked_portal.y - _d*dsin(_ang2);
				_ang +=  180-_coll_hit.image_angle+_coll_hit.linked_portal.image_angle;
				_portal_cooldown = portal_cooldown;
			}
			else if (_coll_hit.object_index == obj_mon) {
				if (my_color == c_aqua && abs(_coll_hit.x-_coll_hit.xprevious) > 1.2 || abs(_coll_hit.y-_coll_hit.yprevious) > 1.2) { instance_destroy(_coll_hit); break;}
				if (my_color == c_orange && _coll_hit.speed < 0.1 &&  _coll_hit.x == _coll_hit.xprevious && _coll_hit.y == _coll_hit.yprevious) {instance_destroy(_coll_hit); break;}
				if (my_color == c_white) { instance_destroy(_coll_hit); break; }
			}
			else if (_coll_hit.object_index == obj_shot) { if (!obj_shot.image_index) {instance_destroy(_coll_hit);} break; }
			else if (_coll_hit.object_index == obj_player) {
				if (my_color == c_aqua && abs(_coll_hit.x-_coll_hit.xprevious) > 1.2 || abs(_coll_hit.y-_coll_hit.yprevious) > 1.2) { with (_coll_hit) { soul_hit(); } break;}
				if (my_color == c_orange && _coll_hit.speed < 0.1 &&  _coll_hit.x == _coll_hit.xprevious && _coll_hit.y == _coll_hit.yprevious) {with (_coll_hit) { soul_hit(); } break;}
				if (my_color == c_white) { with (_coll_hit) {soul_hit()}; break; }
			
			}
			//else if (_coll_hit.object_index == obj_obst) { break; }
			else if (_coll_hit.object_index == obj_grapple) { instance_destroy(_coll_hit); break; }
			else if (_coll_hit.object_index == obj_grapple2) { instance_destroy(_coll_hit); break; }
			else if (_coll_hit.object_index == obj_capshield) { break; }
			else if (_coll_hit.object_index == obj_defshield && instance_exists(_coll_hit.owner) && _coll_hit.owner.my_color == c_green && _coll_hit.owner.green_shield_cooldown > 0) { break; }
			else if (_coll_hit.object_index == obj_redbluehalf && _coll_hit.visible) { break; }
			else if (_coll_hit.object_index == obj_xp) { instance_destroy(_coll_hit); }
		}
	
		if (_portal_cooldown > 0) { _portal_cooldown--; }
		_best_i++;
	}
}

best_i = min(best_i, _best_i);
timer_counter++;
draw_set_color(c_white);
draw_set_alpha(1);