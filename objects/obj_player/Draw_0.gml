my_color = possible_colors[color_index%array_length(possible_colors)];

draw_set_alpha(0.4);
if (!is_array(my_color)) { draw_set_color(my_color); }
if (my_color == c_yellow) {
	draw_line_color(x, y, x+64*dcos(image_angle), y+64*-dsin(image_angle), my_color, c_black);
	if (redyellow_timer > 0) {
		draw_set_alpha(1);
		draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 100*redyellow_timer/redyellow_maxtimer, c_black, my_color, my_color, 0, false, false);
		draw_set_alpha(0.4);
	}
}
if (my_color == c_white) {
	image_angle = 90;
	draw_line_color(x, y, x+24*speed*dcos(gravity_direction), y+24*speed*-dsin(gravity_direction), my_color, c_black);
}
//if (my_color == c_orange || my_color == c_aqua)
//{ draw_line(x, y, orange_dropped_pin[0], orange_dropped_pin[1]); }
if (my_color == c_purple) {
	for (var i=-purple_string_gap+purple_string_x; i<=room_width+purple_string_gap; i+=purple_string_gap)
	{ draw_line(i, -1, i, room_height+1); }
	for (var j=-purple_string_gap+purple_string_y; j<=room_height+purple_string_gap; j+=purple_string_gap)
	{ draw_line(-1, j, room_width+1, j); }
	draw_set_color(c_red);
	draw_rectangle(3, 3, room_width-4, room_height-4, true);
}
if (alarm[3] > 0) {
	var scale = 1+2*(1-power((alarm[3]/sec), 2));
	if (!is_array(my_color)) { draw_sprite_ext(spr_ball, 0, x, y, scale, scale, image_angle, my_color, alarm[3]/sec); }
	else {
		draw_sprite_ext(spr_ball, 2+(x < redbluehalf.x), x, y, scale, scale, image_angle, my_color[0], alarm[3]/sec);
		draw_sprite_ext(spr_ball, 2+(x >= redbluehalf.x), redbluehalf.x, redbluehalf.y, scale, scale, image_angle, my_color[1], alarm[3]/sec);
	}
}
if (my_color == c_orange) {
	
	draw_set_alpha(1);
	draw_set_color(my_color);
	draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, -200*aqua_move_meter/sec, c_black, c_red, c_red, 0, true, false);
	if (aqua_move_meter >= 2*sec)
	{ draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 50*aqua_move_meter/sec, c_black, my_color, my_color, 0, false, false); }
	else
	{ draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 50*aqua_move_meter/sec, c_black, c_dkgray, c_dkgray, 0, false, false); }
}
if (my_color == c_aqua) {
	if (aqua_stunned) { draw_set_color(c_red); }
	//draw_triangle(
	//	x+aqua_parry_rad*dcos(current_time/10), y+aqua_parry_rad*-dsin(current_time/10),
	//	x+aqua_parry_rad*dcos((current_time/10)+120), y+aqua_parry_rad*-dsin((current_time/10)+120),
	//	x+aqua_parry_rad*dcos((current_time/10)+240), y+aqua_parry_rad*-dsin((current_time/10)+240), true);
	draw_circle(x, y, aqua_parry_rad, true);
		
	draw_set_alpha(0);
	if (collision_circle(x, y, aqua_parry_rad, obj_mon, false, false) != noone) { draw_set_alpha(0.1); }
	if (aqua_move_meter >= 2*sec) { draw_set_alpha(draw_get_alpha()+0.1); }
	
	draw_circle(x, y, aqua_parry_rad, false);
	
	//draw_triangle(
	//	x+aqua_parry_rad*dcos(current_time/10), y+aqua_parry_rad*-dsin(current_time/10),
	//	x+aqua_parry_rad*dcos((current_time/10)+120), y+aqua_parry_rad*-dsin((current_time/10)+120),
	//	x+aqua_parry_rad*dcos((current_time/10)+240), y+aqua_parry_rad*-dsin((current_time/10)+240), false);
		
	draw_set_alpha(1);
	draw_set_color(my_color);
	draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, -200*aqua_move_meter/sec, c_black, c_red, c_red, 0, true, false);
	if (aqua_move_meter >= 2*sec)
	{ draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 50*aqua_move_meter/sec, c_black, my_color, my_color, 0, false, false); }
	else
	{ draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 50*aqua_move_meter/sec, c_black, c_dkgray, c_dkgray, 0, false, false); }
	
}
draw_set_alpha(1);
if (instance_exists(green_defshield)) { green_defshield.active = false; }
if (my_color == c_green && !instance_exists(green_shield)) {
	var _lvl = soullevel[?possible_colors[COLOR_INDEX.GREEN]];
	if (instance_exists(green_defshield)) { green_defshield.active = true; green_defshield.allround = green_allround_shield;}
	if (green_shield_cooldown <= 0)
	{ draw_sprite_ext(spr_shield, green_allround_shield, x, y, 1+_lvl/2, 1+_lvl/2, gravity_direction, c_white, 1-0.75*(green_shield_cooldown/green_shield_cooldown_max)); }
	else {draw_sprite_ext(spr_shield, green_allround_shield, x, y, 1+_lvl/2, 1+_lvl/2, gravity_direction, c_white, 1); }
}
if (is_array(my_color) && my_color[0] == c_red && my_color[1] == c_aqua) {
	draw_set_color(c_purple);
	draw_line_width(x, y, redbluehalf.x, redbluehalf.y, 1 + redbluelaser/6);
	if (redbluelaser > 7) { draw_set_color(c_yellow); }
	draw_line_width(x, y, redbluehalf.x, redbluehalf.y, 1);
}

if (speed > obj_mon_spawner.unhandlable_pure_speed)
{
	var _col = possible_colors[(color_index+3)%array_length(possible_colors)];
	if (is_array(_col)) { _col = _col[1]; }
	draw_sprite_ext(sprite_index, image_index, x-hspeed, y-vspeed, image_xscale, image_yscale, image_angle, _col, 0.6);
	cayote_time_for_speed = cayote_time_for_speed_max;
}
if (cayote_time_for_speed > 0) { cayote_time_for_speed--; }
//if (speed > 10) {
//	draw_sprite_ext(sprite_index, image_index, x-2*hspeed, y-2*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//	draw_sprite_ext(sprite_index, image_index, x-3*hspeed, y-3*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//	draw_sprite_ext(sprite_index, image_index, x-4*hspeed, y-4*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//}
draw_set_color(c_white);
if (!is_array(my_color)) {
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, my_color, image_alpha);
	draw_sprite_ext(
		sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white,
		(bigshottery*bigshottery*bigshottery / (bigshottery_max*bigshottery_max*bigshottery_max))*image_alpha
	);
} else {
	redbluehalf.image_angle = image_angle;
	redbluehalf.image_yscale = 2*(x >= redbluehalf.x)-1;
	draw_sprite_ext(sprite_index, 2+(x < redbluehalf.x), x, y, image_xscale+0.3*(!redbluehalf.active), image_yscale+0.3*(!redbluehalf.active), image_angle, my_color[0], image_alpha);
	draw_sprite_ext(sprite_index, 2+(x >= redbluehalf.x), redbluehalf.x, redbluehalf.y, image_xscale+0.3*(redbluehalf.active), image_yscale+0.3*(redbluehalf.active), image_angle, my_color[1], image_alpha);
}
//draw_text(0, 0, string(HP));

var _y = player_id*32;
draw_text(116, 0+_y, "HP");
draw_healthbar(156, 2+_y, room_width/3, 18+_y, HP*10, c_red, c_yellow, c_yellow, 0, true, false);
draw_text(24+room_width/3, 0+_y, string(HP)+"/"+string(MAX_HP))
if (halarity > 0) {draw_text(0, 34+_y, "+"+string(halarity)+" Halariousness Buff"); halarity-=1/sec;}

draw_set_valign(fa_bottom);
draw_set_alpha(alarm[1] / sec);
draw_text(0, room_height-_y, "FILE "+string(player_id+1)+" SAVED");
draw_set_alpha(alarm[2] / sec);
draw_text(0, room_height-_y, "FILE "+string(player_id)+" LOADED");
draw_set_alpha(1);
draw_set_valign(fa_top);


var _levelup_available = false;
for (var i=0; i<array_length(possible_colors); i++) {
	var _col = possible_colors[i];
	if (ds_map_exists(soulscore, _col) && !is_array(_col)) {
		draw_healthbar((room_width/2)+i*16+i*4, 8+player_id*16, (room_width/2)+(i+1)*16+i*4, 24+player_id*16,
		100*soulscore[?_col]/soulscore_before_level_up, c_dkgray, _col, _col, 0, true, false);
		draw_text((room_width/2)+i*16+i*4, 24+player_id*16, string(ds_map_find_value(soullevel, _col)));
		if (soulscore[?_col]/soulscore_before_level_up >= 1) { _levelup_available = true; }
	}
}
if (_levelup_available) { draw_text((room_width/2), 40+player_id*16, "Press Space!"); }