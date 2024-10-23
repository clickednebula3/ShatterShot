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
} else {
	image_index = sprite_get_number(sprite_index)-1;
	if (instance_exists(obj_player)) {
		var _ang = point_direction(x, y, obj_player.x, obj_player.y)%360;
		image_angle %= 360;
		
		if (image_angle-_ang > 180) { _ang += 360; }
		
		image_angle = (10*image_angle + _ang)/11;
	}
}

if (instance_exists(my_parent)) {
	my_parent.image_angle = (10*my_parent.image_angle + image_angle)/11;
} else {
	//if (instance_exists(obj_player)) {
	//	image_angle = (image_angle + 3*point_direction(x, y, obj_player.x, obj_player.y))/4;
	//}
}