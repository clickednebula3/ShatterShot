if (other.owner != self) {
	if (my_color == c_green && !instance_exists(green_shield) && cayote_time_for_speed <= 0 && (green_allround_shield || abs ( point_direction(x, y, other.x, other.y) - gravity_direction) < 45)) {
		other.direction = gravity_direction;
		other.image_angle = gravity_direction;
		other.owner = self;
		return;
	}
	
	if (!other.image_index) { instance_destroy(other); }
	soul_hit();
}
