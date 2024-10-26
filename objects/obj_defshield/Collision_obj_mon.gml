if (active && !allround && other.my_color != c_purple) {
	other.speed = 10;
	other.direction = point_direction(x, y, other.x, other.y);
	if (instance_exists(owner)) { other.direction = owner.gravity_direction; }
}