draw_set_color(c_purple);
draw_circle(x, y, r, false);

draw_set_color(c_black);
draw_circle(x, y, r-1, false);

if (instance_exists(target) && !target_locked) {
	direction = point_direction(x, y, target.x, target.y);
	speed += sqrt(power(x-target.x, 2)+power(y-target.y, 2))/1000;
}

speed *= 0.98;
speed = min(speed, 5);

x = clamp(x, r+2, room_width-r-2);
y = clamp(y, r+2, room_height-r-2);


draw_set_color(c_purple);

for (var i=0; i<4; i++) {
	var ang = direction+45+90 -30*i;
	var c_x = x+(r+2)*dcos(ang);
	var c_y = y-(r+2)*dsin(ang);
	draw_line(c_x, c_y, c_x+l*dcos(ang), c_y-l*dsin(ang));
}

for (var i=0; i<4; i++) {
	var ang = direction+270+45 -30*i;
	var c_x = x+(r+2)*dcos(ang);
	var c_y = y-(r+2)*dsin(ang);
	draw_line(c_x, c_y, c_x+l*dcos(ang), c_y-l*dsin(ang));
}


draw_set_color(c_white);


if (!instance_exists(target) && !target_locked) {
	//find prey
	var coll = ds_list_create();
	var collc = collision_circle_list(x, y, 256, obj_mon, true, true, coll, true);
	
	for (var i=0; i<collc; i++) {
		var possible_prey = coll[|i];
		if (instance_exists(possible_prey)) {
			var taken = false;
			with (obj_spider) { if (target == possible_prey) { taken = true; break; } }
			if (!taken) { target = possible_prey; }
		}
	}
	
	ds_list_destroy(coll);
	
	//var possible_prey = instance_nearest(x, y, obj_mon);
	//if (instance_exists(possible_prey)) {
	//	var taken = false;
	//	with (obj_spider) { if (target == possible_prey) { taken = true; break; } }
	//	if (!taken) { target = possible_prey; }
	//}
}


if (instance_exists(target) && !target_locked) {
	//lock onto touched prey
	var coll = ds_list_create();
	var collc = collision_circle_list(x, y, r+2, obj_mon, true, true, coll, false);

	for (var i=0; i<collc; i++) {
		if (coll[|i] == target) { target_locked = true; break; }
	}

	ds_list_destroy(coll);
}

if (instance_exists(target) && target_locked) {
	target.x = x;
	target.y = y;
}

if ((!instance_exists(target) && target_locked) || (instance_exists(owner) && owner.my_color != c_purple)) {
	instance_destroy();
}