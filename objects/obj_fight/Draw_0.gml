if (SUPER > 0)
{
	global.possible_colors = [
		c_red, c_aqua, c_orange,
		c_yellow, c_purple, c_blue, c_green
	];
	draw_sprite_ext(
		spr_dvd, 2, x, y, image_xscale, image_yscale, image_angle,
		global.possible_colors[SUPER%array_length(global.possible_colors)], image_alpha);
}
else
{
	draw_set_color(c_white);
	if (act_done > 0) {
		if (sprite_index == spr_fight  || sprite_index == spr_yell) {
			var percent = power(1-power(((act_done/sec)), 2), 2);
			draw_circle(x, y, fight_rad*percent, true);
			draw_circle(x, y, fight_rad*0.9*percent, true);
			draw_circle(x, y, fight_rad*0.8*percent, true);
		}
		if (sprite_index == spr_bruh) {
			image_angle += turn_sped;
			turn_sped *= 1.03;
			image_xscale = act_done/sec;
			image_yscale = act_done/sec;
		}
	}
	draw_self();
}