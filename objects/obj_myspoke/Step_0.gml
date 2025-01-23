if (de_immunize_players > 0) { de_immunize_players--; }
if (de_immunize_players == 0) {
	var a = array_length(immune_to);
	for (var i=0; i<array_length(immune_to); i++) {
		if (instance_exists(immune_to[i]) && immune_to[i].object_index == obj_player) {
			array_delete(immune_to, i, 1);
			a = array_length(immune_to);
			i = -1;
			continue;
		}
	}
	de_immunize_players = sec;
}

if (instance_exists(my_child))
{
	my_child.x = x+rad*dcos(image_angle);
	my_child.y = y-rad*dsin(image_angle);
	if (!instance_exists(my_parent)) {
		image_index = 0;
	} else {
		if (image_index == sprite_get_number(sprite_index)-1) {
			image_index = irandom_range(0, sprite_get_number(sprite_index)-1);
		}
	}
	//var _target = my_child.image_angle % 360;
	//image_angle = image_angle % 360;
		
	//var _diff = _target-image_angle;
		
	//if (abs(_diff) > 180) { _diff -= 360; }
		
	//image_angle += _diff/10;
	
	if (redness > 0) { my_child.redness = 1; }
	
} else {
	image_index = sprite_get_number(sprite_index)-1;
	//if (instance_exists(obj_player)) {
	//	var _target = point_direction(x, y, obj_player.x, obj_player.y) % 360;
	//	image_angle = image_angle % 360;
		
	//	var _diff = _target-image_angle;
		
	//	if (abs(_diff) > 180) { _diff -= 360; }
		
	//	image_angle += _diff/10;
	//}
}

if (redness > 0) { redness -= 0.1; }

if (instance_exists(my_parent)) {
	//my_parent.image_angle = (10*my_parent.image_angle + image_angle)/11;
	//var _target = my_parent.image_angle;
	//image_angle = image_angle % 360;
		
	//var _diff = _target-image_angle;
		
	//if (abs(_diff) > 180) { _diff -= 360; }
		
	//image_angle += _diff/10;
		var _target = my_parent.image_angle;
		image_angle = image_angle;
		
		while (_target < 0) { _target += 360; }
		while (image_angle < 0) { image_angle += 360; }
		
		_target %= 360;
		image_angle %= 360;
		
		var _diff = _target - image_angle;
		
		if (abs(_diff) > 180) {
			if (image_angle > _target) { _diff += 360; }
			else { _diff -= 360; }
		}
		image_angle += _diff/10;
	
	
	
} else {
	//if (instance_exists(obj_player)) {
	//	image_angle = (image_angle + 3*point_direction(x, y, obj_player.x, obj_player.y))/4;
	//}
	if (instance_exists(obj_player)) {
		var _target = point_direction(x, y, obj_player.x, obj_player.y);
		image_angle = image_angle;
		
		while (_target < 0) { _target += 360; }
		while (image_angle < 0) { image_angle += 360; }
		
		_target %= 360;
		image_angle %= 360;
		
		var _diff = _target - image_angle;
		
		if (abs(_diff) > 180) {
			if (image_angle > _target) { _diff += 360; }
			else { _diff -= 360; }
		}
		image_angle += _diff/10;
		
		
		//var _diff = _target-image_angle;
		
		//if (abs(_diff) > 180) { _diff -= 360; }
		
		//image_angle += _diff/10;
	}
}