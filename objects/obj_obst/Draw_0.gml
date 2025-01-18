draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, my_color, image_alpha);
draw_sprite_ext(sprite_index, 1, x+32*hspeed, y+32*vspeed, image_xscale, image_yscale, image_angle, c_red, 0.4+0.3*dsin(current_time/3));
speed *= f;

if (content != noone) {
	if (abs(hspeed)>0.1 && abs(x-(room_width/2)) < 10) { f = 0.98;}
	if (abs(vspeed)>0.1 && abs(y-(room_width/2)) < 10) { f = 0.98;}
	if (speed < 0.1) { instance_create_depth(x, y, depth, content); instance_destroy(); }
}