if (ds_map_exists(other.soulscore, my_color)) { other.soulscore[?my_color] += r; other.attempt_levelup(); }
else { ds_map_set(other.soulscore, my_color, r); }
instance_destroy();