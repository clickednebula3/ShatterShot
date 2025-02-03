if (SUPER > 0)
{
	possible_colors = [
		c_red, c_aqua, c_orange,
		c_yellow, c_purple, BLUE, c_green
	];
	var _col = possible_colors[SUPER%array_length(possible_colors)];
	//draw_sprite_ext(spr_dvd, 2, x, y, image_xscale, image_yscale, image_angle, _col, image_alpha);
	draw_sprite_ext(spr_button, 4, x, y, image_xscale, image_yscale, image_angle, _col, image_alpha);
}
else
{
	draw_set_color(c_white);
	if (act_done > 0) {
		if (sprite_index == spr_button_fight || sprite_index == spr_fight  || sprite_index == spr_yell) {
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