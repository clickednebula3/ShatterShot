//draw soulboxes
//draw Z/X/ARROW
//draw wave/mon thing

possible_colors = [c_red, c_yellow, c_green, c_purple, c_blue, c_orange, c_aqua, c_white, [c_red, c_aqua]];

if (!game_started) {
	for (var i=0; i<array_length(possible_colors); i++) {
		var _c = c_gray;
		var _color = possible_colors[i];
		var _selected = (soul_selection_index == i);
		
		if (_selected) { _c = possible_colors[i]; }
		var b = i-soul_selection_index;
		var a = 3;
		
		if (is_array(_color))
		{
			if (_selected) {
				draw_sprite_ext(spr_soulbox, 1, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_selection_index-i), _color[0], 1);
				draw_sprite_ext(spr_soulbox, 2, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_selection_index-i), _color[1], 1);
			} else {
				draw_sprite_ext(spr_soulbox, 0, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_selection_index-i), _c, 1);
			}
			draw_sprite_ext(spr_ball, 2, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_selection_index-i), _color[0], 1);
			draw_sprite_ext(spr_ball, 3, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_selection_index-i), _color[1], 1);
		}
		else
		{
			draw_sprite_ext(spr_soulbox, 0, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, 5*(soul_selection_index-i), _c, 1);
			draw_sprite_ext(spr_ball, 0, room_width/2 - 64*(soul_selection_index-i), 4*room_height/5 + a*(b*b), 2, 2, -90+5*(soul_selection_index-i), _color, 1);
		}
	} 
	draw_sprite_ext(spr_ball, 0, room_width/2, room_height/2, 1, 1, -90, c_dkgray, 1);
	
	soul_selection_index += keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
	soul_selection_index = clamp(soul_selection_index, 0, array_length(possible_colors)-1);
	
	if (keyboard_check_pressed(ord("Z"))) {
		game_started = true;
		instance_destroy(player);
		player = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		player.soulmode_set(soul_selection_index);
		if (instance_exists(player_2)) { player.uses_mouse = true; }
		player.player_id = 0;
	}
	
	if (keyboard_check_pressed(ord("P"))) {
		instance_destroy(player_2)
		player_2 = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		player_2.soulmode_set(soul_selection_index);
		player_2.controller_index = 1;
		player_2.player_id = 1;
	}
}