my_color = c_white;
r = 2;

if (instance_exists(obj_player)) {
	direction = point_direction(x, y, obj_player.x, obj_player.y)+180+random_range(-10, 10);
	speed = 15;
}