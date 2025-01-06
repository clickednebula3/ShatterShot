if (big_mode && collision_circle(x, y, 16, obj_portal, false, true) == noone) {
	var _color = c_orange;
	if (portal_id == PORTAL_ID.B) { _color = c_aqua; }
	
	var _id = portal_id;
	with (obj_portal) { if (portal_id == _id) { instance_destroy(); } }
	
	var _portal = instance_create_depth(clamp(x, 0, room_width), clamp(y, 0, room_height), depth, obj_portal);
	_portal.portal_id = portal_id;
	_portal.my_color = _color;
	if (x <= 0) { _portal.y = clamp(y, 32, room_height-32); _portal.image_angle = 0; }
	if (x >= room_width) { _portal.y = clamp(y, 32, room_height-32); _portal.image_angle = 180; }
	if (y <= 0) { _portal.x = clamp(x, 32, room_width-32); _portal.image_angle = 270; }
	if (y >= room_height) { _portal.x = clamp(x, 32, room_width-32); _portal.image_angle = 90; }
	
	instance_destroy();
}