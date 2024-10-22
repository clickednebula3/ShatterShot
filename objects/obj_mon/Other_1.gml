//if (my_color != c_green && my_color != c_yellow && my_color != c_blue && instance_exists(obj_player) &&
//	obj_player.my_color == c_green) { instance_destroy(); }
if (collision_circle(x, y, (sprite_width+sprite_height)/4, obj_portal, true, true) != noone) { return; }

if (my_color == c_purple) { return; }
if (bbox_left < 0 || bbox_right > room_width) {hspeed *= -1;}
if (bbox_top < 0 || bbox_bottom > room_height) {vspeed *= -1;}