var pad_l = keyboard_check_direct(vk_left) || keyboard_check_direct(ord("A")) || gamepad_button_check(0, gp_padl);
var pad_r = keyboard_check_direct(vk_right) || keyboard_check_direct(ord("D")) || gamepad_button_check(0, gp_padr);
var pad_u = keyboard_check_direct(vk_up) || keyboard_check_direct(ord("W")) || gamepad_button_check(0, gp_padu);
var pad_d = keyboard_check_direct(vk_down) || keyboard_check_direct(ord("S")) || gamepad_button_check(0, gp_padd);
var shift = keyboard_check_direct(vk_shift) || gamepad_button_check(0, gp_face2) || gamepad_button_check(0, gp_shoulderl) || gamepad_button_check(0, gp_shoulderlb);
var shoot_hold = mouse_check_button(mb_left) || gamepad_button_check(0, gp_face3) || gamepad_button_check(0, gp_shoulderr) || gamepad_button_check(0, gp_shoulderrb);
var special_hold = mouse_check_button(mb_right);
var shoot_dont = mouse_check_button_released(mb_left) || gamepad_button_check_released(0, gp_face3) || gamepad_button_check_released(0, gp_shoulderr) || gamepad_button_check_released(0, gp_shoulderrb);
var mode_swap = keyboard_check_pressed(vk_tab);
var aim = gravity_direction;

if (instance_exists(owner)) {
	controller_index = owner.controller_index;
	uses_mouse = owner.uses_mouse;
}


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
	pad_l = gamepad_button_check(gp_id, gp_padl);
	pad_r = gamepad_button_check(gp_id, gp_padr);
	pad_u = gamepad_button_check(gp_id, gp_padu);
	pad_d = gamepad_button_check(gp_id, gp_padd);
	shift = gamepad_button_check(gp_id, gp_face2) || gamepad_button_check(gp_id, gp_shoulderl) || gamepad_button_check(gp_id, gp_shoulderlb);
	shoot_hold = gamepad_button_check(gp_id, gp_face3)			|| gamepad_button_check(gp_id, gp_shoulderr)			|| gamepad_button_check(gp_id, gp_shoulderrb);
	shoot_dont = gamepad_button_check_released(gp_id, gp_face3) || gamepad_button_check_released(gp_id, gp_shoulderr)	|| gamepad_button_check_released(gp_id, gp_shoulderrb);
	mode_swap = gamepad_button_check_pressed(gp_id, gp_face4);
}
#endregion


if (active) {
	x += spd * (pad_r - pad_l) * (1 - (shift/2));
	y += spd * (pad_d - pad_u) * (1 - (shift/2));
}

x = clamp(x, x-bbox_left-1, room_width-(bbox_right-x)+1);
y = clamp(y, y-bbox_top-1, room_height-(bbox_bottom-y)+1);

if (speed > 10) { speed *= 0.99; } else { speed *= 0.97; }