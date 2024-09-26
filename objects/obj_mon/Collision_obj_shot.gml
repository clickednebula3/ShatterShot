if (other.owner != self) {
	if (my_color == c_green && my_shield > 0 && abs(point_direction(x, y, other.x, other.y) - direction) <= 45) {
		other.direction = point_direction(x, y, other.x, other.y);
		other.owner = self;
		my_shield -= 1+2*(other.image_index);
		return;
	}
	if (!other.image_index) { instance_destroy(other); }
	instance_destroy();
}
