my_color = global.possible_colors[color_index%array_length(global.possible_colors)];

draw_set_alpha(0.4);
draw_set_color(my_color);
if (my_color == c_yellow) {
	draw_line_color(x, y, x+64*dcos(image_angle), y+64*-dsin(image_angle), my_color, c_black);
	if (redyellow_timer > 0) {
		draw_set_alpha(1);
		draw_healthbar(bbox_left-4, bbox_bottom+4, bbox_right+4, bbox_bottom+10, 100*redyellow_timer/redyellow_maxtimer, c_black, my_color, my_color, 0, false, false);
		draw_set_alpha(0.4);
	}
}
if (my_color == c_white) { image_angle = 90; draw_line_color(x, y, x+24*speed*dcos(gravity_direction), y+24*speed*-dsin(gravity_direction), my_color, c_black); }
//if (my_color == c_orange || my_color == c_aqua)
//{ draw_line(x, y, orange_dropped_pin[0], orange_dropped_pin[1]); }
if (my_color == c_purple) {
	for (var i=-purple_string_gap+purple_string_x; i<=room_width+purple_string_gap; i+=purple_string_gap)
	{ draw_line(i, -1, i, room_height+1); }
	for (var j=-purple_string_gap+purple_string_y; j<=room_height+purple_string_gap; j+=purple_string_gap)
	{ draw_line(-1, j, room_width+1, j); }
}
if (alarm[3] > 0) {
	var scale = 1+2*(1-power((alarm[3]/sec), 2));
	draw_sprite_ext(spr_soul, 0, x, y, scale, scale, image_angle, my_color, alarm[3]/sec);
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
if (my_color == c_green) { draw_sprite_ext(spr_shield, green_allround_shield, x, y, image_xscale, image_yscale, gravity_direction, c_white, 1); }

if (speed > obj_mon_spawner.unhandlable_pure_speed)
{
	draw_sprite_ext(sprite_index, image_index, x-hspeed, y-vspeed, image_xscale, image_yscale, image_angle, global.possible_colors[(color_index+3)%array_length(global.possible_colors)], 0.6);
	cayote_time_for_speed = cayote_time_for_speed_max;
}
if (cayote_time_for_speed > 0) { cayote_time_for_speed--; }
//if (speed > 10) {
//	draw_sprite_ext(sprite_index, image_index, x-2*hspeed, y-2*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//	draw_sprite_ext(sprite_index, image_index, x-3*hspeed, y-3*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//	draw_sprite_ext(sprite_index, image_index, x-4*hspeed, y-4*vspeed, image_xscale, image_yscale, image_angle, my_color, 0.2);
//}
draw_set_color(c_white);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, my_color, image_alpha);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, c_white, (bigshottery*bigshottery*bigshottery / (bigshottery_max*bigshottery_max*bigshottery_max))*image_alpha);
//draw_text(0, 0, string(HP));

var _y = player_id*32;
draw_text(116, 0+_y, "HP");
draw_healthbar(156, 2+_y, room_width/3, 18+_y, HP*10, c_red, c_yellow, c_yellow, 0, true, false);
draw_text(24+room_width/3, 0+_y, string(HP)+"/"+string(MAX_HP))
if (halarity > 0) {draw_text(0, 34+_y, "+"+string(halarity)+" Halariousness Buff"); halarity-=1/sec;}

draw_set_valign(fa_bottom);
draw_set_alpha(alarm[1] / sec);
draw_text(0, room_height-_y, "FILE "+string(player_id)+" SAVED");
draw_set_alpha(alarm[2] / sec);
draw_text(0, room_height-_y, "FILE "+string(player_id)+" LOADED");
draw_set_alpha(1);
draw_set_valign(fa_top);