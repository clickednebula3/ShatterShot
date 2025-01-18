i_count = 500;
i_len = 3;
best_i = 300;
portal_cooldown = 30;
timer_counter = 0;
alarm[0] = 20*sec;
alarm[1] = 0;//when summoned in specific way
my_color = c_white;
immune_objects = [];
hits_possible = floor(obj_obst_spawner.time_counter/60)+1;
// limit number of hits possible, use times (mins+1)

enum LASER_MOVEMENT {
	NONE,
	SINE
}

movement_type = LASER_MOVEMENT.NONE;
