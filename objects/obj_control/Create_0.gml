enum COLOR_INDEX { RED = 0, YELLOW = 1, GREEN = 2, PURPLE = 3, BLUE = 4, ORANGE = 5, AQUA = 6, WHITE = 7, REDBLUE = 8}
possible_colors = [c_red, c_yellow, c_green, c_purple, c_blue, c_orange, c_aqua, c_white, [c_red, c_aqua]];

game_started = false;
game_paused = false;

player = noone;
player_2 = noone;

soul_selection_index = COLOR_INDEX.GREEN;
