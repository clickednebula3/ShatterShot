if (!instance_exists(linked_portal)) {
	image_index = 0;
	var _my_id = portal_id;
	var _me = self;
	with (obj_portal) {
		if (portal_id != _my_id) { linked_portal = _me; _me.linked_portal = self; break; }
	}
} else {
	image_index = 1;
	var _coll = ds_list_create();
	var _coll_c = collision_rectangle_list(bbox_left, bbox_top, bbox_right, bbox_bottom, all, true, true, _coll, false);
	
	for (var i=0; i<_coll_c; i++) {
		//y=mx
		//tan(ang) = -y/x
		//var m = -dtan(image_angle-90+0.0001);
		//var b = m*x - y;
		
		var _ripe_for_tp = false;
		var _obj = _coll[|i];
		if (!instance_exists(_obj)) { continue; }
		
		image_angle = image_angle%360;
		if (image_angle == 0) { if (_obj.x < x) { _ripe_for_tp = true; } }
		else if (image_angle == 90) { if (_obj.y > y) { _ripe_for_tp = true; } }
		else if (image_angle == 180) { if (_obj.x > x) { _ripe_for_tp = true; } }
		else if (image_angle == 270) { if (_obj.y < y) { _ripe_for_tp = true; } }
		
		//else if ((image_angle+90)%360 > 180) {
		//	if (_coll[|i].y > m*_coll[|i].x + b) { _ripe_for_tp = true; }
		//}
		//else {
		//	if (_coll[|i].y < m*_coll[|i].x + b) { _ripe_for_tp = true; }
		//}
		
		if (_ripe_for_tp) {
			var _d = point_distance(x, y, _coll[|i].x, _coll[|i].y);
			var _ang = point_direction(x, y, _coll[|i].x, _coll[|i].y)-image_angle+180+linked_portal.image_angle;
			_coll[|i].x = linked_portal.x + _d*dcos(_ang);
			_coll[|i].y = linked_portal.y + _d*-dsin(_ang);
			_coll[|i].direction += 180-image_angle+linked_portal.image_angle;
			_coll[|i].image_angle += 180-image_angle+linked_portal.image_angle;
			_coll[|i].gravity_direction += 180-image_angle+linked_portal.image_angle;
		}
	}
	
	ds_list_destroy(_coll);
}