enum COLOR_INDEX { RED = 0, YELLOW = 1, GREEN = 2, PURPLE = 3, BLUE_ = 4, ORANGE = 5, AQUA = 6, WHITE = 7, REDBLUE = 8, PORTAL = 9}
possible_colors = [c_red, c_yellow, c_green, c_purple, BLUE, c_orange, c_aqua, c_white, [c_red, c_aqua], [c_aqua, c_orange], c_lime];
possible_titles = ["Determination", "Justice", "Kindness", "Perseverance", "Integrity", "Bravery", "Patience", "Hope", "Teamwork", "Now you're thinking with portals",""];
plausible_titles = ["Decision", "Shots", "Shield", "Threads", "Drop", "Motion", "Parry", "Gravity Hook", "Split", "Portal", ""];

game_started = false;
game_paused = false;

player = noone;
player_2 = noone;

soul_selection_index = COLOR_INDEX.GREEN;
soul_sel_slow_index = COLOR_INDEX.GREEN;

instance_create_depth(0, 0, depth, obj_mon_spawner);
instance_create_depth(0, 0, depth, obj_obst_spawner);