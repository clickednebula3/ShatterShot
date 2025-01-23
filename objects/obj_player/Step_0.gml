var pad_l = keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A")) || gamepad_button_check(0, gp_padl);
var pad_r = keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")) || gamepad_button_check(0, gp_padr);
var pad_u = keyboard_check_direct(vk_up) || keyboard_check_direct(ord("W")) || gamepad_button_check(0, gp_padu);
var pad_d = keyboard_check_direct(vk_down) || keyboard_check_direct(ord("S")) || gamepad_button_check(0, gp_padd);
var shift = keyboard_check_direct(vk_shift) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_shoulderlb);
var shoot_hold = mouse_check_button(mb_left) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(0, gp_shoulderrb);
var special_hold = mouse_check_button(mb_right);
var shoot_dont = mouse_check_button_released(mb_left) || gamepad_button_check_released(0, gp_face3) || gamepad_button_check_released(0, gp_shoulderr) || gamepad_button_check_released(0, gp_shoulderrb);
var mode_swap = keyboard_check_pressed(vk_tab);
var level_up = keyboard_check_pressed(vk_space) || gamepad_button_check(0, gp_face1);
var aim = gravity_direction;

if (keyboard_check_pressed(vk_f1)) { controller_index = max(0, controller_index-1); }
if (keyboard_check_pressed(vk_f2)) { controller_index++; }
if (keyboard_check_pressed(vk_f3)) { uses_mouse = !uses_mouse; }
if (keyboard_check_pressed(vk_f7)) { game_save("test.txt"); }

//if (keyboard_check_pressed(vk_pageup)) { controller_index++; }
//if (keyboard_check_pressed(vk_pagedown)) { controller_index--; }

#region controller indexes
if (controller_index == 0)//ARROW
{
	pad_l = keyboard_check_direct(vk_left);
	pad_r = keyboard_check_direct(vk_right);
	pad_u = keyboard_check_direct(vk_up);
	pad_d = keyboard_check_direct(vk_down);
	//special_hold = keyboard_check_direct(vk_control) || mouse_check_button(mb_right);
	shoot_hold = keyboard_check_direct(ord("Z")) || mouse_check_button(mb_left);
	shoot_dont = keyboard_check_released(ord("Z")) || mouse_check_button_released(mb_left);
	shift = keyboard_check_direct(ord("X")) || mouse_check_button(mb_right);
	if (uses_mouse) {
		aim = point_direction(x, y, mouse_x, mouse_y);
	} else {
		if ((pad_r xor pad_l) || (pad_d xor pad_u)) { aim = point_direction(0, 0, pad_r-pad_l, pad_d-pad_u); }
	}
	mode_swap = mode_swap || keyboard_check_pressed(vk_end) || keyboard_check_pressed(ord("C"));
}
else if (controller_index == 1)//WASD/ZQSD
{
	pad_l = keyboard_check_direct(ord("A")) || keyboard_check_direct(ord("Q"));
	pad_r = keyboard_check_direct(ord("D"));
	pad_u = keyboard_check_direct(ord("W")) || keyboard_check_direct(ord("Z"));
	pad_d = keyboard_check_direct(ord("S"));
	shift = keyboard_check_direct(vk_lshift);
	if (uses_mouse) {
		aim = point_direction(x, y, mouse_x, mouse_y);
		shoot_hold = mouse_check_button(mb_left);
		shoot_dont = mouse_check_button_released(mb_left);
		shift = shift || mouse_check_button(mb_right);
	} else {
		if ((pad_r xor pad_l) || (pad_d xor pad_u)) { aim = point_direction(0, 0, pad_r-pad_l, pad_d-pad_u); }
		shoot_hold = keyboard_check_direct(vk_lcontrol);
		shoot_dont = keyboard_check_released(vk_lcontrol);
	}
	mode_swap = keyboard_check_pressed(vk_tab);
}
else if (controller_index > 1)//CONTROLLER = controller_index-2
{
	var gp_id = controller_index-2;
	pad_l = gamepad_button_check(gp_id, gp_stickr);
	pad_r = gamepad_button_check(gp_id, gp_padr);
	pad_u = gamepad_button_check(gp_id, gp_padu);
	pad_d = gamepad_button_check(gp_id, gp_padd);
	shift = gamepad_button_check(gp_id, gp_face2) || gamepad_button_check(gp_id, gp_shoulderl) || gamepad_button_check(gp_id, gp_shoulderlb);
	shoot_hold = gamepad_button_check(gp_id, gp_face3)			|| gamepad_button_check(gp_id, gp_shoulderr)			|| gamepad_button_check(gp_id, gp_shoulderrb);
	shoot_dont = gamepad_button_check_released(gp_id, gp_face3) || gamepad_button_check_released(gp_id, gp_shoulderr)	|| gamepad_button_check_released(gp_id, gp_shoulderrb);
	mode_swap = gamepad_button_check_pressed(gp_id, gp_face4);
	if (uses_mouse) {
		aim = point_direction(x, y, mouse_x, mouse_y);
	} else {
		if ((pad_r xor pad_l) || (pad_d xor pad_u)) { aim = point_direction(0, 0, pad_r-pad_l, pad_d-pad_u); }
	}
}
#endregion

if (mode_swap && !shoot_hold && !shift) { soulmode_jump(self); }

if (level_up) { attempt_levelup(); }

HP = clamp(HP, 0, obj_player.MAX_HP);
if (my_color != c_purple && my_color != c_white && my_color != c_aqua && my_color != BLUE &&
	!(is_array(my_color) && my_color[0] == c_red && my_color[1] == c_aqua && redbluehalf.active && !shoot_hold)
	&& portal_stun <= 0
) {
	x += spd * (pad_r - pad_l) * (1 - (shift/2));
	y += spd * (pad_d - pad_u) * (1 - (shift/2));
	if (shoot_hold && !redbluehalf.active) {
		redbluehalf.x += redbluehalf.spd * (pad_r - pad_l) * (1 - (shift/2));
		redbluehalf.y += redbluehalf.spd * (pad_d - pad_u) * (1 - (shift/2));
	}
}
if (collision_circle(x, y, (sprite_width+sprite_height)/4, obj_portal, true, true) == noone) {
	x = clamp(x, x-bbox_left-1, room_width-(bbox_right-x)+1);
	y = clamp(y, y-bbox_top-1, room_height-(bbox_bottom-y)+1);
}

if (alarm[0] > 0) { image_alpha = 0.5 + (floor(alarm[0]/3)%2)/2; }
else { image_alpha = 1; }
if (portal_stun > 0) { portal_stun--; }


//color specific step
gravity = 0;
image_angle = -90;
image_xscale = (image_xscale-1)*0.5 + 1;
image_yscale = (image_yscale-1)*0.5 + 1;
if (speed > obj_mon_spawner.unhandlable_pure_speed) {
	image_xscale += speed/30;
	image_yscale += speed/30;
}

if (redyellow_timer == 0) { redyellow_timer = -1; soulmode_set(self, COLOR_INDEX.RED); }
if (redyellow_timer > 0) { redyellow_timer--; }

if (combo_timer > 0) {
	combo_timer--;
	if (combo_timer == 0) {
		if (combo >= 2) {
			var _combo = instance_create_depth(x, y, depth, obj_combo);
			_combo.combo = combo;
			_combo.my_color = my_color;
		}
		combo = 0;
	}
}

redbluehalf.visible = false;
if (is_array(my_color) && my_color[1] == c_orange && my_color[0] == c_aqua) {
	gravity = 0;
	redbluehalf.gravity = 0;
	redbluehalf.x = x+hspeed;
	redbluehalf.y = y+vspeed;
	
	gravity_direction = aim;
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
	image_angle = -90;
	
	//var _lvl = soullevel[?possible_colors[COLOR_INDEX.PORTAL]];
	if (shoot_hold) {
		var _can = true;
		with (obj_portalpellet) { if (big_mode) { _can = false; break; } }
		if (_can) {
			var shot = instance_create_depth(x, y, depth, obj_portalpellet);
			shot.portal_id = PORTAL_ID.A;
			shot.direction = aim;
			audio_play_sound(snd_yellow_pew, 10, false, 1, 0, 1+random_range(-0.1, 0.1));
			redbluehalf.active = true;
		}
	}
	if (shift) {
		var _can = true;
		with (obj_portalpellet) { if (big_mode) { _can = false; break; } }
		if (_can) {
			var shot = instance_create_depth(x, y, depth, obj_portalpellet);
			shot.portal_id = PORTAL_ID.B;
			shot.direction = aim;
			audio_play_sound(snd_yellow_pew, 10, false, 1, 0, 1+random_range(-0.1, 0.1));
			redbluehalf.active = false;
		}
	}
	
}
else if (is_array(my_color) && my_color[0] == c_red && my_color[1] == c_aqua) {
	gravity = 0;
	redbluehalf.gravity = 0;
	redbluehalf.visible = true;
	if (shift) {
		gravity = 1;
		redbluehalf.gravity = 1;
		redbluelaser++;
	}
	
	if (shoot_dont) { redbluehalf.active = !redbluehalf.active; }
	gravity_direction = point_direction(x, y, redbluehalf.x, redbluehalf.y);
	redbluehalf.gravity_direction = gravity_direction + 180;
	redbluelaser *= 0.9;
	redbluelaser = clamp(redbluelaser, 0, 20);
	if (redbluelaser > 5) {
		var _coll = collision_line(x, y, redbluehalf.x, redbluehalf.y, obj_mon, true, false);
		if (instance_exists(_coll)) { _coll.death_cause = self; instance_destroy(_coll); }
	}
}
else if (my_color == c_lime)
{
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
	image_angle = -90;
	
	if (shoot_dont) {
		var _cube = instance_create_depth(x+20*dcos(direction), y-20*dsin(direction), depth, obj_obst);
		_cube.direction = direction;
		//_cube.speed = 5;
	}
	
}
else if (my_color == c_red)
{
	//if (shift) { game_load("save.txt"); return; }
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
	image_angle = -90;//Users/Shared/*/YoYo Runner.app/Contents/MacOS/Mac_Runner
	if (shoot_dont) {
		var _fight_coll = collision_point(x, y, obj_fight, true, false);
		if (_fight_coll != noone && _fight_coll.alarm[0] <= 0) { _fight_coll.player = self; _fight_coll.alarm[0] = 1; }
		//else { soul_save_game(self); }
	}
	
	if (shift) {
		var _fight_coll = collision_point(x, y, obj_fight, true, false);
		if (instance_exists(_fight_coll) && _fight_coll.alarm[0] <= 0) {
			var _fight_break = instance_create_depth(_fight_coll.x, _fight_coll.y, _fight_coll.depth, obj_mon_break);
			_fight_break.sprite_index = spr_breaks;
			instance_destroy(_fight_coll);
		}
	}
}
else if (my_color == c_yellow)
{
	gravity_direction = aim;
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
	image_angle = gravity_direction;

	/*if (special_hold) {
		x = xprevious;
		y = yprevious;
		if (count_my_shots() <= 10) {
			var shot = instance_create_depth(x, y, depth, obj_shot);
			shot.image_angle = image_angle;
			shot.direction = image_angle;
			shot.owner = self;
			audio_play_sound(snd_yellow_pew, 10, false, 1, 0, 1+random_range(-0.1, 0.1));
		}
	} else */
	if (shoot_dont) {
		var _lvl = soullevel[?possible_colors[COLOR_INDEX.YELLOW]];
		if (bigshottery >= bigshottery_max-8) {
			var shot = instance_create_depth(x, y, depth, obj_shot);
			shot.image_angle = image_angle;
			shot.direction = image_angle;
			shot.image_xscale = 1.5+_lvl/2;
			shot.image_yscale = 1.5+_lvl/2;
			shot.image_index = 1;
			shot.owner = self;
			audio_play_sound(snd_yellow_pew, 10, false, 1, 0, 1+random_range(-0.1, 0.1));
		} else if (count_my_shots() <= 1*(_lvl+1)) {
			var _shot_count = 1+_lvl;
			var _seperation_angle = 10-min(_lvl, 9);
			var _init_ang = ((_shot_count-1)/2)*_seperation_angle;
			for (var i=0; i<_shot_count; i++) {
				var shot = instance_create_depth(x, y, depth, obj_shot);
				shot.image_angle = image_angle-_init_ang+(i*_seperation_angle);
				shot.direction = shot.image_angle;
				shot.owner = self;
			}
			audio_play_sound(snd_yellow_pew, 10, false, 1, 0, 1+random_range(-0.1, 0.1));
		}
		bigshottery = 0;
		spd = 2;
	}
	if (shoot_hold) {
		spd = 1.5;
		bigshottery = clamp(bigshottery+1, 0, bigshottery_max);
	}
}
else if (my_color == c_white)
{
	var _direction_given = uses_mouse || (abs(pad_r-pad_l) || abs(pad_d-pad_u));
	if (shoot_hold && _direction_given) {
		aim = point_direction(0, 0, (pad_r-pad_l), (pad_d-pad_u));
		if (uses_mouse) { aim = point_direction(x, y, mouse_x, mouse_y); }
		if (!instance_exists(white_grapple) && white_grapple_cooldown <= 0) {
			white_grapple = instance_create_depth(x, y, depth-1, obj_grapple2);
			white_grapple.direction = aim;
			white_grapple.owner = self;
			white_grapple_cooldown = white_grapple_cooldown_max;
		}
	}
	if (shift && _direction_given) {
		aim = point_direction(0, 0, (pad_r-pad_l), (pad_d-pad_u));
		if (uses_mouse) { aim = point_direction(x, y, mouse_x, mouse_y); }
		if (!instance_exists(white_grapple) && white_grapple_cooldown <= 0) {
			white_grapple = instance_create_depth(x, y, depth-1, obj_grapple2);
			white_grapple.direction = aim;
			white_grapple.strong_grapple = false;
			white_grapple.owner = self;
			white_grapple_cooldown = white_grapple_cooldown_max;
		}
	}
	if (instance_exists(white_grapple) && white_grapple.gravity < 0.3 && _direction_given) {
		aim = point_direction(0, 0, (pad_r-pad_l), (pad_d-pad_u));
		if (uses_mouse) { aim = point_direction(x, y, mouse_x, mouse_y); }
		white_grapple.direction = aim;
	}
	if (white_grapple_cooldown > 0) { white_grapple_cooldown--; }
	if (instance_exists(white_grapple)) {
		white_grapple_cooldown = white_grapple_cooldown_max;
		gravity_direction = point_direction(x, y, white_grapple.x, white_grapple.y);
		
		if (shift && shoot_hold) { gravity = 0.3; } else { gravity = 0; }
		if (white_grapple.speed < 3) {
			if (shift && shoot_hold) { gravity = 0.6; } else { gravity = 0.3; }
		}
	} else { gravity = 0; }
	//gravity_direction = aim;
	//gravity = 0.15;
	//if (shoot_hold) { speed *= 0.9; }
	//if (shoot_dont && global.score > 1) { speed = 12; direction = gravity_direction; global.score--; }
}
else if (my_color == c_orange)
{
	image_angle = -90;
	gravity_direction = aim;
	direction = gravity_direction;
	var _lvl = soullevel[?possible_colors[COLOR_INDEX.ORANGE]];
	if (pad_r || pad_l || pad_d || pad_u || aqua_move_meter < 0) { aqua_move_meter += 1 - (shift/4) + _lvl/4; }
	if (shoot_dont && aqua_move_meter >= 2*sec) { speed = 30; aqua_move_meter = -sec/2; }
	speed *= 0.8+clamp(_lvl/40, 0, 0.2);
	aqua_move_meter = clamp(aqua_move_meter, -sec/2, 2*sec);
}
else if (my_color == c_aqua)
{
	image_angle = -90;
	gravity_direction = aim;
	direction = gravity_direction;
	var _lvl = soullevel[?possible_colors[COLOR_INDEX.AQUA]];
	aqua_parry_rad = 64 + 4*_lvl;
	
	if (!aqua_stunned && (pad_r || pad_l || pad_d || pad_u)) { aqua_move_meter -= 1 - (shift/4) - clamp(_lvl, 0, 9)/10; }
	else {aqua_move_meter++; }
	
	if (aqua_move_meter > 0) {
		aqua_stunned = false;
		x += spd * (pad_r - pad_l) * (1 - (shift/2));
		y += spd * (pad_d - pad_u) * (1 - (shift/2));
	}
	if (aqua_move_meter < 0 && !aqua_stunned) { stun_soul(self); }
	
	if (shoot_dont && !aqua_stunned) {
		var _coll_mon = ds_list_create();
		var _coll_mon_count = collision_circle_list(x, y, aqua_parry_rad, obj_mon, false, false, _coll_mon, false);
		if (_coll_mon_count > 0) {
			for (var i=0; i<_coll_mon_count; i++) {
				count_for_combo(self, 1);
				_coll_mon[|i].death_cause = self;
				instance_destroy(_coll_mon[|i]);
			} 
		}
		ds_list_destroy(_coll_mon);
		var _coll_boss = ds_list_create();
		var _coll_boss_count = collision_circle_list(x, y, aqua_parry_rad, [obj_myspoke], false, true, _coll_boss, false);
		if (_coll_boss_count > 0) { for (var i=0; i<_coll_boss_count; i++)
			{ if (instance_exists(_coll_boss[|i])) { _coll_boss[|i].myspoke_hurt(self, 1, 0.5);}  } }
		ds_list_destroy(_coll_boss);
		if (_coll_mon_count <= 0 && _coll_boss_count <= 0) { stun_soul(self); }
	}
	speed *= 0.7;
	aqua_move_meter = clamp(aqua_move_meter, -sec/2, 2*sec);
}
else if (my_color == c_purple)
{
	var _lvl = soullevel[?possible_colors[COLOR_INDEX.PURPLE]];
	var gap = purple_string_gap-clamp(8*_lvl, 0, purple_string_gap-8);
	var g = gap/2;
	
	var a = 5*(purple_string_gap/purple_string_gap_reasonable);
	x = (a*x - ((x-purple_string_x-g)%gap) + g)/a;
	y = (a*y - ((y-purple_string_y-g)%gap) + g)/a;
	x += 1.81 * spd * (pad_r - pad_l) * (1 - (shift/2));
	y += 1.81 * spd * (pad_d - pad_u) * (1 - (shift/2));
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
	
	//purple_string_x += dsin(current_time/25)*dsin(current_time/25)/3;
	//purple_string_y += dcos(current_time/16)*dcos(current_time/16)/3;
	purple_string_x += (x-(room_width/2))/(3*room_width/2);
	purple_string_y += (y-(room_height/2))/(3*room_height/2);
	if (purple_string_x >= purple_string_gap) { purple_string_x -= purple_string_gap; }
	if (purple_string_y >= purple_string_gap) { purple_string_y -= purple_string_gap; }
}
else if (my_color == BLUE)
{
	//New System
	
	gravity = ((gravity-0.4)*0.5)+0.4;
	image_angle = gravity_direction;
	hspeed += 0.1 * (pad_r - pad_l) * (1 - (shift/2));
	vspeed += 0.1 * (pad_d - pad_u) * (1 - (shift/2));
	var top_or_bottom = (bbox_top < 2 || bbox_bottom > room_height-2);
	var left_or_right = (bbox_left < 2 || bbox_right > room_width-2);
	//if ((shoot_dont || shift) && left_or_right && speed <= 0.5) { hspeed = 16*-dcos(gravity_direction);}
	//if ((shoot_dont || shift) && top_or_bottom && speed <= 0.5) { vspeed = 16*dsin(gravity_direction);}
	//if (shoot_dont) { direction = aim; speed = 20; }//gravity_direction-=180; }
	if (top_or_bottom || left_or_right) { speed *= 0.9; if (shoot_hold) { speed = 0; } }
	if ((top_or_bottom || left_or_right) && shoot_dont) { direction = aim; speed = 19.5; }
	if ((top_or_bottom || left_or_right) && shift) { direction = aim; speed = 5; }
	
	//OG System
	
	//gravity = ((gravity-0.4)*0.5)+0.4;
	//image_angle = gravity_direction;
	//hspeed += 0.1 * (pad_r - pad_l) * (1 - (shift/2));
	//vspeed += 0.1 * (pad_d - pad_u) * (1 - (shift/2));
	//var top_or_bottom = (bbox_top < 2 || bbox_bottom > room_height-2);
	//var left_or_right = (bbox_left < 2 || bbox_right > room_width-2);
	//if ((shoot_dont || shift) && left_or_right && speed <= 0.5) { hspeed = 16*-dcos(gravity_direction);}
	//if ((shoot_dont || shift) && top_or_bottom && speed <= 0.5) { vspeed = 16*dsin(gravity_direction);}
	////if (shoot_dont) { gravity_direction-=90; }
	//if (shoot_dont) { gravity_direction-=180; }
	////if (shoot_hold) { gravity_direction -= 10; }
	////if (shoot_hold && (abs(pad_r-pad_l) || abs(pad_d-pad_u))) { gravity_direction = point_direction(0, 0, (pad_r-pad_l), (pad_d-pad_u)); }
}
else if (my_color == c_green)
{
	green_allround_shield = false;
	speed = 0;
	if (shoot_hold && !instance_exists(green_shield) && green_shield_cooldown <= 0) { green_allround_shield = true; x = xprevious; y = yprevious; }
	if (shift && !instance_exists(green_shield) && green_shield_cooldown <= 0) {
		green_shield = instance_create_depth(x, y, depth, obj_capshield);
		green_shield.direction = aim;
		green_shield.speed = 15;
		green_shield.owner = self;
		var _lvl = soullevel[?possible_colors[COLOR_INDEX.GREEN]];
		green_shield.image_xscale = 1+_lvl/2;
		green_shield.image_yscale = 1+_lvl/2;
	}
	if (instance_exists(green_shield) && green_shield.alarm[0] > sec/2) {
		if (uses_mouse) { aim = point_direction(green_shield.x, green_shield.y, mouse_x, mouse_y); }
		green_shield.direction = aim;
	}
	if (green_shield_cooldown > 0) { green_shield_cooldown--; }
	gravity_direction = aim;
	if (portal_stun<=0 && (x!=xprevious||y!=yprevious))
	{ direction += angle_difference(point_direction(xprevious, yprevious, x, y), direction)/10; }
}

if (speed > 10) { speed *= 0.99; } else { speed *= 0.97; }