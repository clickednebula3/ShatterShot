if (collision_circle(x, y, 32, obj_portal, false, false) != noone) { return; }

if (image_index) {
	image_index = max(0, image_index-1);
	if (bbox_left < 0 || bbox_right > room_width) { hspeed *= -1; }
	if (bbox_top < 0 || bbox_bottom > room_height) { vspeed *= -1; }
}