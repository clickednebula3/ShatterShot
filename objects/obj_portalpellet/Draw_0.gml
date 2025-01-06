var _color = c_orange;
if (portal_id == PORTAL_ID.B) { _color = c_aqua; }

draw_set_color(_color);
 

if (big_mode) {
	draw_circle(x, y, 3.5, false);

	timer+=sec/6;
	
	if (timer%(sec/2) == 0) {
		for (var i=0; i<3; i++) {
			var _ = instance_create_depth(peripheral_x(), peripheral_y(120*i), depth, object_index);
			_.big_mode = false;
			_.portal_id = portal_id;
			_.speed = 0.2;
			_.direction = random_range(0, 360);
		}
	}
	
	draw_set_color(c_white);
	draw_circle(peripheral_x(), peripheral_y(0), 1, false);
	draw_circle(peripheral_x(), peripheral_y(120), 1, false);
	draw_circle(peripheral_x(), peripheral_y(240), 1, false);

} else {
	timer++;
	if (timer > sec) { instance_destroy(); }
	draw_set_alpha(0.75-3*(timer/sec)/4);
	draw_circle(x, y, 1, false);
	draw_set_alpha(1);
	
}

draw_set_color(c_white);