r = 400;
s = 100;
l = 20;
select = 0;
p = 0.5;
a = 0.15;
timer = 0;
up_down_selection = 0;

uses_keyboard = false;
//todo: add this and mouse

player_count = 0;
select2 = 0;
p2 = 0.5;

set_setter = 0;
title_orb_color = c_white;


enum MENU {
	MAIN,
	SETTINGS
}

menu = MENU.MAIN;

settings = [
	["Music", false],
	["SFX", false],
	["Players", 1],
	["Obstacles", true],
	["Hide XP", false],
];
sets_p = 0;
sets_select = 0;


start_anim_timer_max = sec;
test = 0;

draw_set_circle_precision(64);
x = room_width/2;
y = room_height+128+32;

#region Colors Data
// > Colors

//name
//title
//color[s]

//is_for_player
//is_for_mons
//is_for_obstacle
//is_for_laser

//gains_xp



//also uses colors: xp, bullets, portals

enum CO {
	RED_ = 0, YELLOW_ = 1,
	ORANGE_ = 2, AQUA_ = 3,
	GREEN_ = 4, PURPLE_ = 5,
	BLUE_ = 6, WHITE_ = 7,
	TEAMWORK_ = 8, PORTALS_ = 9, MINECRAFT = 10,
}

global.COLO = [
	{
		co: 0,
		enabled: true,
		color: c_red,
		title: "Decide",
		phrase: "Stay Determined!",
		fun_combo: "get decided imo",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 1,
		enabled: true,
		color: c_yellow,
		title: "Shoot",
		phrase: "Serve Justice",
		fun_combo: "pew pew",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,//pew pew type
	},
	{
		co: 2,
		enabled: false,
		color: c_orange,
		title: "Bash",
		phrase: "Bravery",
		fun_combo: "Skull Bash!",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 3,
		enabled: false,
		color: c_aqua,
		title: "Parry",
		phrase: "Patience",
		fun_combo: "brain freeze",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: true,
	},
	{
		co: 4,
		enabled: true,
		color: c_green,
		title: "Shield (Verb)",
		phrase: "Slay em with Kindness",
		fun_combo: "the caps lock",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: false,
	},
	{
		co: 5,
		enabled: false,
		color: c_purple,
		title: "Thread",
		phrase: "Perseverence",
		fun_combo: "welcome to the internet\nhow was the fall",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,
	},
	{
		co: 6,
		enabled: true,
		color: BLUE,
		title: "Drop",
		phrase: "Integrity",
		fun_combo: "dudu du du",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: true,
		is_for_laser: false,
	},
	{
		co: 7,
		enabled: false,
		color: c_white,
		title: "Gravitate",
		phrase: "Hope",
		fun_combo: "Fate",
		is_for_player: true,
		is_for_mon: true,
		is_for_obst: false,
		is_for_laser: true,
	},
	
	{
		co: 8,
		enabled: false,
		color: [c_aqua, c_red],
		title: "Teamwork",
		phrase: "Except you juggle both",
		fun_combo: ":glitter: Dreamwork :glitter:",
		is_for_player: true,
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//
	},
	{
		co: 9,
		enabled: false,
		color: [c_orange, c_aqua],
		title: "Portal",
		phrase: "Now you're thinking with portals",
		fun_combo: "speedy thing in,\nspeedy thing out",
		is_for_player: true,//controls portals
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//there will be a moving circle that spawns gel, press the button to change its type
		//turrets spawn too
	},
	{
		co: 10,
		enabled: false,
		color: [c_lime, make_color_rgb(115, 72, 20)],
		title: "Minecraft",
		phrase: "I yearned for the mines",
		fun_combo: "Chicken Jockey",
		is_for_player: true,
		is_for_mon: false,
		is_for_obst: false,//building block?
		is_for_laser: false,
		//the mode itself:
		//
	},
	{
		co: 11,
		enabled: false,
		color: [c_lime, c_red],
		title: "Sborb",
		phrase: "Time travel by brain hurting juice",
		fun_combo: "sweet catch",
		is_for_player: true,//
		is_for_mon: false,
		is_for_obst: false,
		is_for_laser: false,
		//the mode itself:
		//
	}
];
#endregion

colors = [];
titles = [];
y_offs = [];

//for (var i=0; i<2; i++) {
//	array_push(colors, c_white);
//	array_push(titles, "none");
//	array_push(y_offs, 0);
//}

for (var i=array_length(global.COLO)-1; i>=0; i--) {
	if (/*!is_array(global.COLO[i].color)*/global.COLO[i].enabled) {
		array_push(colors, global.COLO[i].color);
		array_push(titles, global.COLO[i].title);
		array_push(y_offs, 0);
	}
}

function make_color_average(color_initial, color_final, interpolate = 0.5) {
	
	return make_color_rgb(
		sqrt(  (1-interpolate)*power(color_get_red(color_initial), 2) + interpolate*power(color_get_red(color_final), 2)   ),
		sqrt(  (1-interpolate)*power(color_get_green(color_initial), 2) + interpolate*power(color_get_green(color_final), 2)   ),
		sqrt(  (1-interpolate)*power(color_get_blue(color_initial), 2) + interpolate*power(color_get_blue(color_final), 2)   )
	);
}

function draw_elli_contraption_lid_cap(elli, ellipush, ellh = elli/2) {
	var col = draw_get_color();
	if (abs(ellipush) <= 2) {
		//
	} else if (ellipush > 0) {
		draw_ellipse(
			(room_width/2)+elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			false);
		draw_set_color(c_black);
		draw_ellipse(
			(room_width/2)+elli-ellipush+(ellipush/2)+3, (room_height/2)-ellh+32+5,
			(room_width/2)+elli+ellipush+(ellipush/2)-3, (room_height/2)+ellh+32-5,
			false);
		
	} else {
		draw_ellipse(
			(room_width/2)-elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)-elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			false);
		draw_set_color(c_black);
		draw_ellipse(
			(room_width/2)-elli-ellipush+(ellipush/2)-3, (room_height/2)-ellh+32+5,
			(room_width/2)-elli+ellipush+(ellipush/2)+3, (room_height/2)+ellh+32-5,
			false);
	}
	draw_set_color(col);
}

function draw_elli_contraption(elli, ellipush, ellh = elli/2) {
	var col = draw_get_color();
	if (abs(ellipush) <= 2) {
		draw_ellipse(
			(room_width/2)-elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)-elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			true);
		draw_ellipse(
			(room_width/2)+elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			true);
		draw_set_color(c_black);
		draw_roundrect(
			(room_width/2)-elli+(ellipush/2)+1, (room_height/2)-ellh+30,
			(room_width/2)+elli+(ellipush/2)-1, (room_height/2)+ellh+34,
			false);
		draw_set_color(col);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)-ellh+32,
			2);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)+ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)+ellh+32,
			2);
			
	} else if (ellipush > 0) {
		draw_ellipse(
			(room_width/2)-elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)-elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			true);
		draw_set_color(c_black);
		draw_roundrect(
			(room_width/2)-elli+(ellipush/2), (room_height/2)-ellh+30,
			(room_width/2)+elli+(ellipush/2), (room_height/2)+ellh+34,
			false);
		draw_set_color(col);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)-ellh+32,
			2);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)+ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)+ellh+32,
			2);
		
	} else {
		draw_ellipse(
			(room_width/2)+elli-ellipush+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+ellipush+(ellipush/2), (room_height/2)+ellh+32,
			true);
		draw_set_color(c_black);
		draw_roundrect(
			(room_width/2)-elli+(ellipush/2), (room_height/2)-ellh+30,
			(room_width/2)+elli+(ellipush/2), (room_height/2)+ellh+34,
			false);
		draw_set_color(col);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)-ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)-ellh+32,
			2);
		draw_line_width(
			(room_width/2)-elli+(ellipush/2), (room_height/2)+ellh+32,
			(room_width/2)+elli+(ellipush/2), (room_height/2)+ellh+32,
			2);
	}
	draw_set_color(col);
}

function make_color_down(color, percent = 2/3) {
	return make_color_hsv(color_get_hue(color), color_get_saturation(color), percent*color_get_value(color));
}

function draw_settings_box(pad_lr, pad_ud, concentration, roundrect = true, color_up = draw_get_color()) {
	var pad = 32+(200*concentration);
	var off = 16;
	
	draw_set_color(make_color_down(color_up, 0.6));
	
	if (roundrect) {
		draw_roundrect(
			-off+4*pad*pad_lr,
			-off+2*pad*pad_ud,
			off+room_width-(4*pad*(1-pad_lr)),
			off+room_height-(2*pad*(1-pad_ud)),
			true);
	} else {
		draw_rectangle(
			-off+4*pad*pad_lr,
			-off+2*pad*pad_ud,
			off+room_width-(4*pad*(1-pad_lr)),
			off+room_height-(2*pad*(1-pad_ud)),
			true);
	}
	
	pad++;
	
	draw_set_color(make_color_down(color_up, 0.8));
	
	draw_line(
		-off+roundrect-8*pad*concentration, -off+roundrect-4*pad*concentration,
		-off+4*pad*pad_lr, -off+2*pad*pad_ud);
	draw_line(
		off+room_width+8*pad*concentration-roundrect, -off+roundrect-4*pad*concentration,
		off+room_width-(4*pad*(1-pad_lr)), -off+2*pad*pad_ud);
	draw_line(
		-off+2*roundrect-8*pad*concentration, off+room_height+4*pad*concentration-roundrect,
		-off+4*pad*pad_lr, off+room_height-(2*pad*(1-pad_ud)));
	draw_line(
		off+room_width+8*pad*concentration-roundrect, off+room_height+4*pad*concentration-roundrect,
		off+room_width-(4*pad*(1-pad_lr)), off+room_height-(2*pad*(1-pad_ud)));
	
	draw_set_color(color_up);
	
	if (roundrect) {
		draw_roundrect(
			-off-8*pad*concentration,
			-off-4*pad*concentration,
			off+room_width+8*pad*concentration,
			off+room_height+4*pad*concentration,
			true);
	} else {
		draw_rectangle(
			-off-8*pad*concentration,
			-off-4*pad*concentration,
			off+room_width+8*pad*concentration,
			off+room_height+4*pad*concentration,
			true);
	}
		
	return pad; //the only thing that changes :p
}

function draw_soul_in_cube(
	back_top_left_x, back_top_left_y,
	front_bottom_right_x, front_bottom_right_y,
	_soul_color = c_white, _soul_off = 0, _ang = 90
) {
	var _x = (back_top_left_x+front_bottom_right_x)/2;
	var _y = (back_top_left_y+front_bottom_right_y)/2;
	
	var minimize = (s/10)*abs(dcos(_ang));
	var size = (s/4) + _soul_off/8 - minimize;
	
	var _temp_color = draw_get_color();
	draw_set_color(_soul_color);
	draw_circle(_x+_soul_off*dcos(_ang), _y-_soul_off*dsin(_ang), size, false);
	draw_set_color(c_black);
	draw_circle(_x+_soul_off*dcos(_ang), _y-_soul_off*dsin(_ang), 0.8*size, false);
	draw_set_color(_temp_color);
}

function draw_soul_cube(
	_angle, _side_length, _radius,
	_around_x, _around_y,
	_perspective_x, _perspective_y, _perspective_z,
	_outline = true, _face_sprite = spr_cube_face,
	_draw_soul = false, _soul_color = c_white, _soul_off = 0
) {
	var ang = darcsin(_side_length/ _radius)/2;
	var w = 2;
	
	var dot_0 = [_around_x+_radius*dcos(_angle), _around_y-_radius*dsin(_angle)];
	var dot_p = [_perspective_x, _perspective_y, _perspective_z];//z is further, depending on FOV


	var ang_a = _angle+ang;
	var ang_b = _angle-ang;
	var dot_a = [_around_x+_radius*dcos(ang_a), _around_y-_radius*dsin(ang_a)];
	var dot_b = [_around_x+_radius*dcos(ang_b), _around_y-_radius*dsin(ang_b)];

	//draw_set_color(c_dkgray);
	//draw_circle(_around_x, _around_y, _radius, true);
	//draw_set_color(c_white);
	//draw_circle(dot_p[0], dot_p[1], 2, true);
	
	var ang_dot_front_p = darctan2(_around_y-dot_p[1], dot_p[2]);
	var len_front_l = _side_length*dcos(ang_dot_front_p);//cant just choose numbers. compare the angs to parralel line
	var len_front_r = _side_length*dcos(ang_dot_front_p);
	var front_a = [dot_a[0]+len_front_l*dcos(ang_a), dot_a[1]-len_front_l*dsin(ang_a)];
	var front_b = [dot_b[0]+len_front_r*dcos(ang_b), dot_b[1]-len_front_r*dsin(ang_b)];

	//
	var ang_a2 = point_direction(dot_p[0], dot_p[1]+200, dot_a[0], dot_a[1])+180;
	var ang_b2 = point_direction(dot_p[0], dot_p[1]+200, dot_b[0], dot_b[1])+180;

	var ang_front_top_p = 90-darctan2(_around_y-dot_p[1]+_side_length*dcos(ang_dot_front_p), dot_p[2]+_side_length*dsin(ang_dot_front_p));
	var len_top_l = _side_length*dcos(ang_front_top_p);
	var len_top_r = _side_length*dcos(ang_front_top_p);
	var top_a = [front_a[0]+len_top_l*dcos(ang_a2), front_a[1]-len_top_l*dsin(ang_a2)];
	var top_b = [front_b[0]+len_top_r*dcos(ang_b2), front_b[1]-len_top_r*dsin(ang_b2)];
	
	ang_a2 = point_direction(dot_p[0], dot_p[1], dot_a[0], dot_a[1])+180;
	ang_b2 = point_direction(dot_p[0], dot_p[1], dot_b[0], dot_b[1])+180;

	var bot_a = [dot_a[0]+len_top_l*dcos(ang_a2), dot_a[1]-len_top_l*dsin(ang_a2)];
	var bot_b = [dot_b[0]+len_top_r*dcos(ang_b2), dot_b[1]-len_top_r*dsin(ang_b2)];
	
	if (_outline)
	{
		//back_bottom
		draw_line_width(bot_a[0], bot_a[1], bot_b[0], bot_b[1], w);
		//back_top
		draw_line_width(top_a[0], top_a[1], top_b[0], top_b[1], w);
		//back_left
		draw_line_width(bot_a[0], bot_a[1], top_a[0], top_a[1], w);
		//back_right
		draw_line_width(bot_b[0], bot_b[1], top_b[0], top_b[1], w);
		
		//left_bottom
		draw_line_width(bot_a[0], bot_a[1], dot_a[0], dot_a[1], w);
		//left_top
		draw_line_width(front_a[0], front_a[1], top_a[0], top_a[1], w);
		
		//right_bottom
		draw_line_width(bot_b[0], bot_b[1], dot_b[0], dot_b[1], w);
		//right_top
		draw_line_width(front_b[0], front_b[1], top_b[0], top_b[1], w);
		
		
		//soul
		if (_draw_soul) { draw_soul_in_cube(top_a[0], top_a[1], dot_b[0], dot_b[1], _soul_color, _soul_off, _angle); }
		
		//front_bottom
		draw_line_width(dot_a[0], dot_a[1], dot_b[0], dot_b[1], w);
		//front_top
		draw_line_width(front_a[0], front_a[1], front_b[0], front_b[1], w);
		//front_left
		draw_line_width(dot_a[0], dot_a[1], front_a[0], front_a[1], w);
		//front_right
		draw_line_width(dot_b[0], dot_b[1], front_b[0], front_b[1], w);
		
		
	}
	else /*fill faces with stretched sprite*/
	{
		
		draw_sprite_pos(_face_sprite, 0, top_a[0], top_a[1], top_b[0], top_b[1], bot_b[0], bot_b[1], bot_a[0], bot_a[1], 1);//back
		draw_sprite_pos(_face_sprite, 0, bot_a[0], bot_a[1], bot_b[0], bot_b[1], dot_b[0], dot_b[1], dot_a[0], dot_a[1], 1);//bottom
		
		if (_draw_soul) { draw_soul_in_cube(top_a[0], top_a[1], dot_b[0], dot_b[1], _soul_color, _soul_off, _angle); }
		
		draw_sprite_pos(_face_sprite, 0, top_a[0], top_a[1], front_a[0], front_a[1], dot_a[0], dot_a[1], bot_a[0], bot_a[1], 1);//left
		draw_sprite_pos(_face_sprite, 0, front_b[0], front_b[1], top_b[0], top_b[1], bot_b[0], bot_b[1], dot_b[0], dot_b[1], 1);//right
		
		draw_sprite_pos(_face_sprite, 0, top_a[0], top_a[1], top_b[0], top_b[1], front_b[0], front_b[1], front_a[0], front_a[1], 1);//top
		draw_sprite_pos(_face_sprite, 0, front_a[0], front_a[1], front_b[0], front_b[1], dot_b[0], dot_b[1], dot_a[0], dot_a[1], 1);//face
	}
	
	//debug points
	//draw_circle(bot_a[0], bot_a[1], 2, true);
	//draw_circle(bot_b[0], bot_b[1], 2, true);
	//draw_circle(dot_a[0], dot_a[1], 2, true);
	//draw_circle(dot_b[0], dot_b[1], 2, true);
	//draw_circle(top_a[0], top_a[1], 2, true);
	//draw_circle(top_b[0], top_b[1], 2, true);
	//draw_circle(front_a[0], front_a[1], 2, true);
	//draw_circle(front_b[0], front_b[1], 2, true);

}