//draw soulboxes
//draw Z/X/ARROW
//draw wave/mon thing

possible_colors = [c_red, c_yellow, c_green, c_purple, c_blue, c_orange, c_aqua, c_white, [c_red, c_aqua], [c_aqua, c_orange]];

window_set_max_width(960);
window_set_max_height(1000);

if (!game_started) {
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
			draw_set_font(fnt_ol_reliable);
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
			draw_set_font(fnt_ol_reliable);
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
		instance_destroy(player_2)
		player_2 = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		soulmode_set(player_2, soul_selection_index);
		player_2.controller_index = 1;
		player_2.player_id = 1;
	}
}
