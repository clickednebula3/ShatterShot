draw_set_color(c_white);
draw_text(0, 0, "SOUL   LV "+string(1+floor(log2(global.score))));
draw_text(0, 16, string(global.score));

//DEBUG
//if (mouse_check_button(mb_right)) {
//	instance_create_depth(mouse_x, mouse_y, depth, obj_player);
//}
if (keyboard_check_pressed(vk_pageup)) { wave_index++; }
if (keyboard_check_pressed(vk_pagedown)) { wave_index = max(wave_index-1, 0); }


//draw_rectangle(1, 1, room_width-2, room_height-2, true);

//draw_sprite(spr_crosshair, 0, mouse_x, mouse_y);
draw_set_alpha(0.4);
draw_sprite(spr_wavecard, 0, room_width-32, 0);
wave_index = min(wave_index, array_length(waves)-1);
if (wave_index == array_length(waves)-1) {
	var c = (current_time/10)%255;
	var col = make_color_hsv(50*((c/50)%5), 255, 255);
	draw_sprite_ext(spr_wavecard, 9, room_width-32, 0, image_xscale, image_yscale, image_angle, col, draw_get_alpha());
	draw_set_alpha(1);
	return;
}
var found_color = [
	false, false, false, false,
	false, false, false, false
];
if (array_contains(waves[wave_index], c_white)) { found_color[0] = true; }
if (array_contains(waves[wave_index], c_red)) { found_color[1] = true; }
if (array_contains(waves[wave_index], c_green)) { found_color[2] = true; }
if (array_contains(waves[wave_index], c_blue)) { found_color[3] = true; }
if (array_contains(waves[wave_index], c_aqua)) { found_color[4] = true; }
if (array_contains(waves[wave_index], c_orange)) { found_color[5] = true; }
if (array_contains(waves[wave_index], c_yellow)) { found_color[6] = true; }
if (array_contains(waves[wave_index], c_purple)) { found_color[7] = true; }
for (var i=0; i<8; i++) {
	if (found_color[i]) { draw_sprite(spr_wavecard, i+1, room_width-32, 0); }
}
draw_set_alpha(1);

//draw_text(0, 64, string(wave_index)+" WAVE    "+string(wave_summonee_index)+" SUMMONEE");