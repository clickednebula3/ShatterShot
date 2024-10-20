/// @description Break Timer
alarm[2] = 2*sec;
vspeed = irandom_range(-10, -3);
hspeed = irandom_range(-10, 10);
image_index = irandom_range(2, 5);
if (initial_shred) {
	var _c = irandom_range(1, 4);
	for (var i=0; i<_c; i++) {
		var _xp = instance_create_depth(x, y, depth, obj_xp);
		_xp.my_color = my_color;
		_xp.r = random_range(0.5, 2);
	}
	for (var i=0; i<3-2*(half_soul_mode>0); i++) {
		var shred_piece = instance_create_depth(x, y, depth, object_index);
		shred_piece.alarm[0] = -1;
		shred_piece.alarm[1] = 1;
		shred_piece.my_color = my_color;
		shred_piece.initial_shred = false;
	}
}