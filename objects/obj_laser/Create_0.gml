i_count = 500;
i_len = 3;
best_i = 300;
portal_cooldown = 30;
timer_counter = 0;
alarm[0] = 20*sec;
alarm[1] = 0;//when summoned in specific way
my_color = c_white;
immune_objects = [];

enum LASER_MOVEMENT {
	NONE,
	SINE
}

movement_type = LASER_MOVEMENT.NONE;
