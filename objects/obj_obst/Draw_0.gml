draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, my_color, image_alpha);

var w = image_xscale*sprite_get_width(sprite_index)/2;
var h = image_yscale*sprite_get_height(sprite_index)/2;

if (my_color == c_yellow) {
	draw_set_color(c_black);
	draw_rectangle(x-w, y-h, x+w, y+h, false);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x, y, "BOOM");
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if (warning_still_there) {
	//draw_sprite_ext(
	//	sprite_index, 1, clamp(x, w, room_width-w), clamp(y, h, room_height-h),
	//	image_xscale, image_yscale, image_angle, c_red, 0.4+0.3*dsin(current_time/3)
	//);
	draw_set_color(c_red);
	draw_set_alpha(0.4+0.3*dsin(current_time/3));
	for (var i=2; i<5; i++) {//2,3,4
		draw_rectangle(
			clamp(x, w, room_width-w)-w+i, clamp(y, h, room_height-h)-h+i-1,
			clamp(x, w, room_width-w)+w-i, clamp(y, h, room_height-h)+h-i-1, true
		);
	}
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	if (x > 0 && x < room_width && y > 0 && y < room_height) { warning_still_there = false; }
}
speed *= f;

if (content != noone) {
	if (abs(hspeed)>0.1 && abs(x-(room_width/2)) < 10) { f = 0.98;}
	if (abs(vspeed)>0.1 && abs(y-(room_width/2)) < 10) { f = 0.98;}
	if (speed < 0.1) { instance_create_depth(x, y, depth, content); instance_destroy(); }
}