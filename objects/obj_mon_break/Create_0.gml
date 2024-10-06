#macro sec	 game_get_speed(gamespeed_fps)
enum HALF_SOUL {
	NONE = 0,
	RIGHT = 1,
	LEFT = 2
}
initial_shred = true;
alarm[0] = sec;
my_color = c_white;
half_soul_mode = HALF_SOUL.NONE;
image_alpha = 0.5;