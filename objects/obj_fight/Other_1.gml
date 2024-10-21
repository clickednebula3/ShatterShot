if (bbox_left < 0 || bbox_right > room_width) { hspeed *= -1; direction += random_range(-1, 1); }
if (bbox_top < 0 || bbox_bottom > room_height) { vspeed *= -1; direction += random_range(-1, 1); }