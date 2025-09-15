//draw soulboxes
//draw Z/X/ARROW
//draw wave/mon thing

possible_colors = [c_red, c_yellow, c_green, c_purple, BLUE, c_orange, c_aqua, c_white, [c_red, c_aqua], [c_aqua, c_orange], c_lime];



//window_set_size(960, 720);
//camera_set_view_size(camera_get_active(), 960, 720);
//camera_set_view_pos(camera_get_active(), -160, -120);
draw_set_color(c_white);
draw_rectangle(-3, -3, room_width+2, room_height+2, true);
draw_rectangle(-2, -2, room_width+1, room_height+1, true);
draw_rectangle(-1, -1, room_width, room_height, true);

if (keyboard_check_direct(vk_space)) {
	//var w = room_width/(room_width+room_height);
	//var h = room_height/(room_width+room_height);
	
	//room_width = clamp(room_width-1, 256, 1096);
	//room_height = clamp(room_height-1 , 128, 1096);
	
	room_width = mouse_x;
	room_height = mouse_y;
}

/*
	var _p = 64;
	var _w = room_width/2;
	var _h = room_height/2;

	draw_set_color(c_gray);
	if (mouse_x > (2*_p) && mouse_x < (_w-_p) && mouse_y > (_p) && mouse_y < (_h-_p)) { draw_set_color(c_ltgray); }
	draw_roundrect(2*_p, _p, _w-_p, _h-_p, true);
	draw_roundrect(2*_p-1, _p-1, _w-_p+1, _h-_p+1, true);
	draw_roundrect(2*_p-2, _p-2, _w-_p+2, _h-_p+2, true);

	draw_set_color(c_gray);
	if (mouse_x > (_w+_p) && mouse_x < (room_width-_p*2) && mouse_y > (_h+_p) && mouse_y < (room_height-_p)) { draw_set_color(c_ltgray); }
	draw_roundrect(_w+_p, _h+_p, room_width-_p*2, room_height-_p, true);
	draw_roundrect(_w+_p-1, _h+_p-1, room_width-_p*2+1, room_height-_p+1, true);
	draw_roundrect(_w+_p-2, _h+_p-2, room_width-_p*2+2, room_height-_p+2, true);

	draw_set_color(c_gray);
	//if (mouse_x > (2*_p) && mouse_x < (_w-_p) && mouse_y > (_p) && mouse_y < (_h-_p)) { draw_set_color(c_ltgray); }
	draw_roundrect(_w+_p, _p, room_width-_p*2, _h-_p, true);
	draw_roundrect(_w+_p-1, _p-1, room_width-_p*2+1, _h-_p+1, true);
	draw_roundrect(_w+_p-2, _p-2, room_width-_p*2+2, _h-_p+2, true);

	draw_set_color(c_gray);
	//if (mouse_x > (2*_p) && mouse_x < (_w-_p) && mouse_y > (_p) && mouse_y < (_h-_p)) { draw_set_color(c_ltgray); }
	draw_roundrect(2*_p, _h+_p, _w-_p, room_height-_p, true);
	draw_roundrect(2*_p-1, _h+_p-1, _w-_p+1, room_height-_p+1, true);
	draw_roundrect(2*_p-2, _h+_p-2, _w-_p+2, room_height-_p+2, true);

	draw_set_color(c_white);
*/



if (!game_started)
{
	for (var i=0; i<array_length(possible_colors); i++) {
		var _c = c_gray;
		var _color = possible_colors[i];
		var _selected = (soul_selection_index == i);
		var _title = possible_titles[i];
		var _name = plausible_titles[i];
		
		if (_selected) { _c = possible_colors[i]; }
		var b = i-soul_sel_slow_index;
		var a = 3;
		
		if (is_array(_color))
		{
			if (_selected) {
				draw_sprite_ext(spr_soulbox, 1, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_sel_slow_index-i), _color[0], 1);
				draw_sprite_ext(spr_soulbox, 2, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_sel_slow_index-i), _color[1], 1);
			} else {
				draw_sprite_ext(spr_soulbox, 0, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_sel_slow_index-i), _c, 1);
			}
			
			draw_sprite_ext(spr_ball, 2, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_sel_slow_index-i), _color[0], 1);
			draw_sprite_ext(spr_ball, 3, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_sel_slow_index-i), _color[1], 1);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt_yeon);
			//draw_set_font(fnt_ol_reliable);
			draw_set_color(_color[0]);
			var _scale = 0.5+0.5*_selected;
			draw_text_transformed(room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b) - 64 - 24*_selected, _name, _scale, _scale, 5*(soul_sel_slow_index-i));
			if (_selected) {
				draw_set_color(_color[1]);
				draw_text_transformed(room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b) + 64, _title, 0.8, 0.8, 5*(soul_sel_slow_index-i));
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_white);
		}
		else
		{
			draw_sprite_ext(spr_soulbox, 0, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_sel_slow_index-i), _c, 1);
			draw_sprite_ext(spr_ball, 0, room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_sel_slow_index-i), _color, 1);
			
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_set_font(fnt_yeon);
			//draw_set_font(fnt_ol_reliable);
			draw_set_color(_color);
			var _scale = 0.5+0.5*_selected;
			draw_text_transformed(room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b) - 64 - 24*_selected, _name, _scale, _scale, 5*(soul_sel_slow_index-i));
			if (_selected) {
				draw_text_transformed(room_width/2 - 64*(soul_sel_slow_index-i), 4*room_height/5 + a*(b*b) + 64, _title, 0.8, 0.8, 5*(soul_sel_slow_index-i));
			}
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			draw_set_color(c_white);
		}
	} 
	draw_sprite_ext(spr_ball, 0, room_width/2, room_height/2, 1, 1, -90, c_dkgray, 1);
	
	soul_selection_index += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
	soul_selection_index = clamp(soul_selection_index, 0, array_length(possible_colors)-1);
	soul_sel_slow_index = (5*soul_sel_slow_index+soul_selection_index)/6;
	
	if (keyboard_check_pressed(ord("Z"))) {
		game_started = true;
		instance_destroy(player);
		player = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		soulmode_set(player, soul_selection_index);
		if (instance_exists(player_2)) { player.uses_mouse = true; }
		player.player_id = 0;
	}
	
	if (keyboard_check_pressed(ord("P"))) {
		instance_destroy(player_2);
		player_2 = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		soulmode_set(player_2, soul_selection_index);
		player_2.controller_index = 1;
		player_2.player_id = 1;
	}
}
else
{
	if (keyboard_check_pressed(vk_f6)) { game_paused = !game_paused;} //!! do this
	
	
	var _max_distance = 128;
	for (var i=16; i<room_width; i+=16) {
		for (var j=16; j<room_height; j+=16) {
			var a = 0;
			
			if (instance_exists(player)) {
				a += 1 - min(point_distance(player.x, player.y, i, j), _max_distance)/_max_distance;
			}
			
			if (a > 0) {
				draw_set_alpha(a);
				draw_set_color(c_white);
				var _mon_list = ds_list_create();
				var _mon_c = collision_circle_list(i, j, _max_distance/2, obj_mon, true, true, _mon_list, false);
				if (_mon_c > 0) {
					var _team_no = 0;
					for (var k=0; k<_mon_c; k++) {
						_team_no += instance_exists(_mon_list[|k].purplayer_my_purpellet);
					}
					if (_team_no > _mon_c/2) { draw_set_color(c_red); }
					else { draw_set_color(c_silver); }
				}
				ds_list_destroy(_mon_list);
				draw_point(i, j);
			}
		}
	}
	
	#region let's never talk about this
	//draw_set_color(c_white);
	//var rad = 64;
	//for (var i=16; i<room_width; i+=16) {
	//	for (var j=16; j<room_height; j+=16) {
			
	//		//really ugly code please make elegent later:
	//		//or please redo this endentation section entirely
			
	//		var a = 0;
	//		var b = 0;
	//		while (true) { //fake once-loop to use break
				
				
				
	//			draw_set_color(c_red);
	//			with (obj_mon) {
	//				a += 1 - min(point_distance(x, y, i, j), rad)/rad;
					
	//				var c_list = ds_list_create();
	//				var c_count = collision_circle_list(x, y, rad, obj_mon, true, true, c_list, false);
					
	//				if (c_count > 3) {
	//					b += 1 - min(point_distance(x, y, i, j), rad)/rad;
	//				}
					
	//				if (point_distance(x, y, i, j) < rad) {
	//					//a = power(a-0.1, 3);
	//					draw_set_color(my_color);
	//				}
					
	//				ds_list_destroy(c_list);
	//			}
	//			//if (instance_exists(obj_mon)) { a += 0.8*(1 - min(_dist/2, rad)/rad); }
				
	//			if (instance_exists(player)) {
	//				var _dist = point_distance(player.x, player.y, i, j);
	//				a += 1 - min(_dist, rad)/rad;
	//				//a = sqrt(a);
	//				if (a > 0.1) { draw_set_color(c_white); b = max(0, sqrt(b)-0.5); }
	//			}
				
	//			break;
	//		}
			
			
	//		draw_set_alpha(min(abs(a), 1));
	//		draw_circle(i, j, 4*b, false);
	//		draw_set_color(c_white);
	//	}
	//}
	//draw_set_alpha(1);
	#endregion
	
}


if (game_started && !instance_exists(obj_player)) {
	draw_set_font(fnt_yeon_BIG);
	//draw_set_font(fnt_ol_reliable_BIG);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2, room_height/4, "GAME OVER", 1, 1, 0);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
