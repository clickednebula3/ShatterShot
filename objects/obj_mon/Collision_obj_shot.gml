if (other.owner != self) {
	if (my_color == c_green && my_shield > 0 && abs(point_direction(x, y, other.x, other.y) - direction) <= 45) {
		other.direction = point_direction(x, y, other.x, other.y);
		other.owner = self;
		my_shield -= 1+2*(other.image_index);
		return;
	}
	count_for_combo(other.owner, 1);
	if (my_color == c_green) { soul_heal(other.owner, 1); }
	if (!other.image_index) { instance_destroy(other); }
	instance_destroy();
}
