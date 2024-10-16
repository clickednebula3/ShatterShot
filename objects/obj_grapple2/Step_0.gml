speed *= 0.94;
Time++;
image_angle = 3*Time+3*x+1.5*y;
x = clamp(x, x-bbox_left-1, room_width-(bbox_right-x)+1);
y = clamp(y, y-bbox_top-1, room_height-(bbox_bottom-y)+1);


var _coll = collision_circle(x, y, 88, obj_mon, true, false);
if (instance_exists(_coll)) {
	gravity_direction = point_direction(x, y, _coll.x, _coll.y);
	gravity = 1;
} else { gravity = max(0, gravity-0.33/sec); }

if (instance_exists(grappled_soul)) {
	speed = 0;
	gravity = 0;
	x = grappled_soul.x;
	y = grappled_soul.y;
}