draw_set_color(c_white);
draw_text(0, 0, "SOUL   LV "+string(1+floor(log2(global.score))));
draw_text(0, 16, string(global.score));

//DEBUG
//if (mouse_check_button(mb_right)) {
//	instance_create_depth(mouse_x, mouse_y, depth, obj_player);
//}
//if (keyboard_check_pressed(vk_pageup)) { wave_index++; }
//if (keyboard_check_pressed(vk_pagedown)) { wave_index = max(wave_index-1, 0); }


time_counter++;
time_counter += 10*(keyboard_check_direct(vk_pageup)-keyboard_check_direct(vk_pagedown));
draw_text(0, room_height-20, string(time_counter/sec)-((10*time_counter/sec)%1)/10);
if (time_between_spawns_now <= 0) {
	time_between_spawns_now = time_between_spawns_max - (time_between_spawns_max-time_between_spawns_min)*clamp(time_counter/time_between_spawns_width, 0, 1);
	
	var _summonee_data = get_random_soulmon_data(time_counter);
	var _summonee_color = _summonee_data[WEIGHT_SUMMONEE_DATA.COLOR];
	var _summonee_patch_data = _summonee_data[WEIGHT_SUMMONEE_DATA.PATCH_SIZE];
	var _summonee_patch = irandom_range(_summonee_patch_data[0], _summonee_patch_data[1]);
	
	var _x_y = [random_range(64, room_width-64), random_range(64, room_height-64)];
	var _summonee_arr = [];
	
	for (var i=0; i < _summonee_patch; i++) {
		array_push(_summonee_arr, instance_create_depth(_x_y[0], _x_y[1], depth, obj_mon_spawn));
		_summonee_arr[i].my_color = _summonee_color;
		
		_x_y = [
			clamp(_x_y[0] + random_range(-32, 32), 64, room_width-64),
			clamp(_x_y[1] + random_range(-32, 32), 64, room_width-64)
		];
	}
	
	//if (_summonee_patch > 0 && (_summonee_color == c_orange || _summonee_color == c_aqua)) {
		
	//		orange_points = [
	//			[xstart, ystart],
	//			[
	//				clamp(irandom_range(64, room_width-64), xstart-orange_distance, xstart+orange_distance),
	//				clamp(irandom_range(64, room_height-64), ystart-orange_distance, ystart+orange_distance),
	//			],
	//			[
	//				clamp(irandom_range(64, room_width-64), xstart-orange_distance, xstart+orange_distance),
	//				clamp(irandom_range(64, room_height-64), ystart-orange_distance, ystart+orange_distance),
	//			],
	//		];
	//	var _points = _summonee_arr[0].orange_points;
	//	for (var i=1; i<_summonee_patch; i++) {
	//		_summonee_arr[i].x = _summonee_arr[0].x;
	//		_summonee_arr[i].y = _summonee_arr[0].y;
	//		_summonee_arr[i].orange_points[0] = _points[0];
	//		_summonee_arr[i].orange_points[1] = _points[1];
	//		_summonee_arr[i].orange_points[2] = _points[2];
	//		_summonee_arr[i].orange_target_point = i;
	//	}
	//}
	
	wave_summonee_index++;
} else { time_between_spawns_now --; }

//draw_rectangle(1, 1, room_width-2, room_height-2, true);

//draw_sprite(spr_crosshair, 0, mouse_x, mouse_y);
//draw_set_alpha(0.4);
//draw_sprite(spr_wavecard, 0, room_width-32, 0);
//wave_index = min(wave_index, array_length(waves)-1);
//if (wave_index == array_length(waves)-1) {
//	var c = (current_time/10)%255;
//	var col = make_color_hsv(50*((c/50)%5), 255, 255);
//	draw_sprite_ext(spr_wavecard, 9, room_width-32, 0, image_xscale, image_yscale, image_angle, col, draw_get_alpha());
//	draw_set_alpha(1);
//	return;
//}
//var found_color = [
//	false, false, false, false,
//	false, false, false, false
//];
//if (array_contains(waves[wave_index], c_white)) { found_color[0] = true; }
//if (array_contains(waves[wave_index], c_red)) { found_color[1] = true; }
//if (array_contains(waves[wave_index], c_green)) { found_color[2] = true; }
//if (array_contains(waves[wave_index], c_blue)) { found_color[3] = true; }
//if (array_contains(waves[wave_index], c_aqua)) { found_color[4] = true; }
//if (array_contains(waves[wave_index], c_orange)) { found_color[5] = true; }
//if (array_contains(waves[wave_index], c_yellow)) { found_color[6] = true; }
//if (array_contains(waves[wave_index], c_purple)) { found_color[7] = true; }
//for (var i=0; i<8; i++) {
//	if (found_color[i]) { draw_sprite(spr_wavecard, i+1, room_width-32, 0); }
//}
//draw_set_alpha(1);

//draw_text(0, 64, string(wave_index)+" WAVE    "+string(wave_summonee_index)+" SUMMONEE");