//var p = 0.6;//0.5 -> 90 deg
//p = point_direction(x, y, mouse_x, mouse_y)/180;
//p_spd += (keyboard_check_direct(vk_right)-keyboard_check_direct(vk_left))/1000;
//p_spd *= p_f;
//p += p_spd;
//p = clamp(p, p_bounds[0], p_bounds[1]);

//var dot_0 = [x+r*dcos(p*180), y-r*dsin(p*180)];
//var dot_p = [x, y-700, 3000];//z is further, depending on FOV


//var select_i = 0;
//var p2_max = -1;
//for (var i=0; i<count; i++) {
//	var ang = p*180+20*i;
//	var p2 = ((90-abs(ang-90))/90); //percent BASED ON percent
//	p2 = clamp(p2, 0.001, 1);
//	if (p2 > p2_max) { p2_max = p2; select_i = i; }
//}



test += (alarm[0] > 0);
test = max(test, 0);
timer += 1/sec;

var pad_lr = clamp(mouse_x/room_width, -0.25, 1.25);
var pad_ud = clamp(mouse_y/room_width, -0.25, 1.25);

draw_set_alpha(power(set_setter, 2));
draw_set_color(make_color_down(title_orb_color, 0.5));
draw_settings_box(pad_lr, pad_ud, 1-set_setter, false, title_orb_color);

draw_set_alpha(1);
draw_set_color(make_color_down(title_orb_color, 0.5));
draw_set_font(fnt_yeon_BIG);
draw_set_halign(fa_center);
draw_text(room_width/2, 40, "SHATTER SH  T");
draw_set_halign(fa_left);

var span = 180;

if (menu == MENU.MAIN && player_count == 0)
{
	var count = array_length(colors);
	var _lr = (keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left));
	var _ud = (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up));
	if (alarm[0] > 0) { _lr = 0; _ud = 0; }

	select += _lr;// * (up_down_selection <= 1);
	up_down_selection += _ud;

	select = clamp(select, 0, count-1);
	up_down_selection = clamp(up_down_selection, 1, 2+(!uses_keyboard));

	//if (abs(_lr)) { timer = 0; }
	p = lerp(p, ((select+1) / count), a);
	var _selected_i = 0;

	for (var i=0; i<count; i++) {
		var ang = p*180 + (i*180/count) - 90;//-(90/count); //9->10, 8->
		ang =  i*22.5 + p*22.5*count - 22.5*count + 90;
		var p2 = ((90-abs(ang-90))/90); //percent BASED ON percent
		//^I do not remember how both these maths work
		p2 = clamp(p2, 0.001, 1);
		var _off = -20;
		var _color_down = make_color_down(colors[i]);
		if (colors[i] == c_white) { _color_down = c_white; }
		draw_set_color(c_ltgray);
		var am_selected = abs(-(count-select)+i+1) < 1;
		if (am_selected) {
			if (up_down_selection <= 1) {
				draw_set_color(_color_down);
				_off = 20*(2*abs(dsin((120*timer)%360))-1);
				if (alarm[0] > 0) { _off *= power(alarm[0]/start_anim_timer_max, 2); }
			}
			_selected_i = i;
		}
		if (abs(-(count-select)+i+1) > 1) { draw_set_color(c_gray); }
		if (abs(-(count-select)+i+1) > 2) { draw_set_color(c_dkgray); }
		var eject = clamp((!am_selected)*test*test/1.3, 0, 2000);
		y_offs[i] = lerp(y_offs[i], _off, 0.1);
		draw_soul_cube(ang, s/**sqrt(p2)*/, r+eject, x, y, x, y-1000, 2000, true, spr_cube_face, true, colors[i], y_offs[i]);
	}
	draw_set_color(c_white);


	draw_set_halign(fa_center);
	draw_set_color(title_orb_color);
	title_orb_color = make_color_average(title_orb_color, colors[_selected_i], 0.1);
	draw_text(room_width/2-4, 40, "                O ");
	draw_set_valign(fa_middle);
	draw_set_font(fnt_yeon_MID);

	var play_text = "Play";// play_text = titles[_selected_i];
	draw_set_color(c_gray); if (up_down_selection == 1) { draw_set_color(colors[_selected_i]); play_text = titles[_selected_i]; }
	draw_roundrect(x-128, 2*room_height/3, x+128, (2*room_height/3)+64, true);
	draw_set_color(make_color_down(colors[_selected_i])); if (up_down_selection == 1) { draw_set_color(colors[_selected_i]); }
	draw_text(x, (2*room_height/3)+26, play_text);
	
	draw_set_color(c_gray); if (up_down_selection == 2) { draw_set_color(c_white); }
	draw_roundrect(x-128, (2*room_height/3)+64+16, x+128, (2*room_height/3)+128+16, true);
	draw_text(x, (2*room_height/3)+64+42, "Settings");

	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_set_color(c_white);

	if (alarm[0] <= 0 && keyboard_check_pressed(vk_enter)) {
		if (up_down_selection < 2) { alarm[0] = start_anim_timer_max; }
		if (up_down_selection == 2) { menu = MENU.SETTINGS; }
	}

	if (alarm[0] == 1) {
		var ctrl = instance_create_depth(0, 0, depth, obj_control);
		var orb = instance_create_depth(room_width/2, room_height/2, depth, obj_player);
		orb.possible_colors = colors;
		orb.my_color = colors[_selected_i];
		orb.color_index = _selected_i;
		ctrl.player = orb;
		ctrl.game_started = true;
		instance_destroy();
	}
	
	set_setter *=  0.98;
}
else if (menu == MENU.SETTINGS)
{
	if (keyboard_check_pressed(vk_enter)) { up_down_selection = 2; menu = MENU.MAIN; }
	
	set_setter = (set_setter-1) * 0.9 + 1;
	var _ud = (keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up));
	
	sets_select += _ud;
	sets_select = clamp(sets_select, 0, array_length(settings)-1);
	sets_p = clamp((sets_p-sets_select)*0.9+sets_select, 0, array_length(settings)-1);
	
	var elli = 256/**/*(4/5);
	var ellw = 3*elli/4;
	var ellipush = 2 * (pad_lr-0.5) * 32; /* -16-k to 16+k */
	var max_h = 2*32/3;
	var radius = 1.1*elli/2;
	
	draw_set_alpha(power(set_setter, 2));
	draw_set_color(c_white);
	draw_elli_contraption(elli, ellipush);
	draw_elli_contraption(ellw, ellipush, radius);
	draw_elli_contraption_lid_cap(ellw, ellipush, radius);
	if (abs(ellipush) > 2) {
	draw_set_color(c_black);
		draw_rectangle((room_width/2)+ellw+(ellipush/2)+ellipush*(ellipush>0), (room_height/2)+32-(elli/2)+1, (room_width/2)+ellw+(ellipush/2), (room_height/2)+32+(elli/2)-2, false);
		draw_rectangle((room_width/2)-ellw+(ellipush/2)+ellipush*(ellipush<0), (room_height/2)+32-(elli/2)+1, (room_width/2)-ellw+(ellipush/2), (room_height/2)+32+(elli/2)-2, false);
	}
	//draw_rectangle((room_width/2)-ellw-(3*ellipush/2)*(2*(ellipush>0)-1), (room_height/2)+32-radius+1, (room_width/2)-ellw-(ellipush/2)*(ellipush>0), (room_height/2)+32+radius-1, false);
	//draw_rectangle((room_width/2)+ellw+(ellipush/2), (room_height/2)+32-radius+1, (room_width/2)+ellw+(ellipush/2), (room_height/2)+32+radius-1, false);
	//draw_elli_contraption(elli*0.8, ellipush);
	//draw_elli_contraption(elli*0.7, ellipush);
	//draw_elli_contraption(elli*0.6, ellipush);
	
	var ang_gap = 4;
	for (var i=round(sets_p)-1; i<round(sets_p)+2; i++) {
		//if (i < 0) { continue; }
		var d = i-sets_p;
		var temp = (360-(ang_gap*10))/10;
		var ang_top = d*temp - temp/2 + ang_gap/2;//a bit looser than -90 to 90
		var ang_bot = d*temp + temp/2 - ang_gap/2;//same
		//var ang = d*180/2.5;
		//var len = radius*dcos(ang);
		//draw_rectangle(
		//	(room_width/2)-0.9*elli, (room_height/2)+32+radius*dsin(ang_top),
		//	(room_width/2)+0.9*elli, (room_height/2)+32+radius*dsin(ang_bot), true);
		
		draw_set_color(c_black);
		//var ang_bot_up = (d+1)*36 - 18 + 3;
		if (abs( radius*(  dsin(ang_top-ang_gap)-dsin(ang_top)  ) ) > 3) {
			draw_rectangle(
				(room_width/2)-ellw+(ellipush/2)*(2*(ellipush<0)-1), (room_height/2)+32+radius*dsin(ang_top-ang_gap),
				(room_width/2)+ellw-(ellipush/2)*(2*(ellipush<0)-1), (room_height/2)+32+radius*dsin(ang_top),
				false);
		}
		if (abs( radius*(  dsin(ang_bot+ang_gap)-dsin(ang_bot)  ) ) > 3) {
			draw_rectangle(
				(room_width/2)-ellw+(ellipush/2)*(2*(ellipush<0)-1), (room_height/2)+32+radius*dsin(ang_bot),
				(room_width/2)+ellw-(ellipush/2)*(2*(ellipush<0)-1), (room_height/2)+32+radius*dsin(ang_bot+ang_gap),
				false);
		}
		draw_set_color(c_white);
		draw_line(
			(room_width/2)-ellw+(ellipush/2)-ellipush*dcos(ang_top), (room_height/2)+32+radius*dsin(ang_top),
			(room_width/2)+ellw+(ellipush/2)-ellipush*dcos(ang_top), (room_height/2)+32+radius*dsin(ang_top));
		draw_line(
			(room_width/2)-ellw+(ellipush/2)-ellipush*dcos(ang_top-ang_gap), (room_height/2)+32+radius*dsin(ang_top-ang_gap),
			(room_width/2)+ellw+(ellipush/2)-ellipush*dcos(ang_top-ang_gap), (room_height/2)+32+radius*dsin(ang_top-ang_gap));
		draw_line(
			(room_width/2)-ellw+(ellipush/2)-ellipush*dcos(ang_bot), (room_height/2)+32+radius*dsin(ang_bot),
			(room_width/2)+ellw+(ellipush/2)-ellipush*dcos(ang_bot), (room_height/2)+32+radius*dsin(ang_bot));
		draw_line(
			(room_width/2)-ellw+(ellipush/2)-ellipush*dcos(ang_bot-ang_gap), (room_height/2)+32+radius*dsin(ang_bot+ang_gap),
			(room_width/2)+ellw+(ellipush/2)-ellipush*dcos(ang_bot-ang_gap), (room_height/2)+32+radius*dsin(ang_bot+ang_gap));
		
		
	}
	
	draw_set_halign(fa_center);
	draw_set_color(make_color_down(title_orb_color, 0.8));
	draw_text(room_width/2-4, 40, "                O ");
	draw_set_valign(fa_middle);
	
	draw_set_color(c_white);
	//draw_elli_contraption_lid_cap(elli*0.6, ellipush);
	//draw_elli_contraption_lid_cap(elli*0.7, ellipush);
	//draw_elli_contraption_lid_cap(elli*0.8, ellipush);
	draw_elli_contraption_lid_cap(elli, ellipush);
	
	draw_set_alpha(1);
	
	//for (var i=0; i<array_length(settings); i++) {
	//	var position = -sign(sets_p-i)/power(2, abs(sets_p-i)+1);
	//	draw_line(
	//		(room_width/2)+(ellipush/2)-5,
	//		(room_height/2)+32+elli*position,
	//		(room_width/2)+(ellipush/2)+5,
	//		(room_height/2)+32+elli*position
	//	);
	//}
	
}
else
{
	set_setter *=  0.98; // include for all except menu.settings
}



//draw_set_color(c_white);
//draw_circle(x, y, r, true);
//draw_circle(x, y, r+s, true);
//draw_circle(x, y-l, r+s-5, true);
//draw_circle(x, y-r-s-30*l, 2, true);

////draw_set_color(c_yellow);
////draw_circle(x, y-(3*s/4), r, true);
////draw_circle(x, y-(3*s/4), r+s, true);



////draw_set_color(c_red);
////draw_line(x, y, x+(r+s)*dcos(p*180), y-(r+s)*dsin(p*180));

//draw_set_color(c_aqua)
//draw_line(x+r*dcos(p*180-ang), y-r*dsin(p*180-ang), x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang));
//draw_line(x+r*dcos(p*180+ang), y-r*dsin(p*180+ang), x+(r+s)*dcos(p*180+ang), y-(r+s)*dsin(p*180+ang));

//var ang1 = point_direction(x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang), x, y-r-s-30*l);
//var ang2 = point_direction(x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang), x, y-r-s-30*l);

//draw_set_color(c_lime);
//draw_line(x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang), x, y-r-s-30*l);
//draw_line(x+(r+s)*dcos(p*180+ang), y-(r+s)*dsin(p*180+ang), x, y-r-s-30*l);

////draw_set_color(c_lime);
////var ang1 = point_direction(x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang), x, -200);
////draw_line(x+(r+s)*dcos(p*180-ang), y-(r+s)*dsin(p*180-ang), x, -200);