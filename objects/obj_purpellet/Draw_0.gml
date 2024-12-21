if (instance_exists(obj_player) && obj_player.my_color == c_purple) {
	timer+=1+redness/20;
	redness *= redness_f;
	
	var rrr = rad + dsin(timer+20)*dcos(timer) + redness/20;
	
	draw_set_color(c_purple);
	draw_circle(x, y, 2+rrr, false);
	draw_set_color(c_black);
	draw_circle(x, y, 1.25*rrr, false);
	draw_set_color(make_color_rgb(255, 255-4*redness, 255-4*redness));
	draw_circle(x, y, 0.75*rrr, false);
	
	if (redness > 0) {
		draw_set_alpha(redness/40);
		var _ang = point_direction(x, y, owner.x, owner.y);
		draw_circle(x, y, 16, true);
		draw_line(x+16*dcos(_ang), y-16*dsin(_ang), owner.x-16*dcos(_ang), owner.y+16*dsin(_ang));
		draw_circle(owner.x, owner.y, 16, true);
		draw_set_alpha(1);
	}
}