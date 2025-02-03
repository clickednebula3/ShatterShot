direction = 45 + 90*irandom_range(0, 3);
possible_acts = [spr_button_fight];//[spr_fight, spr_act, spr_item, spr_mercy];
possible_act_acts = [spr_bruh, /*spr_color, */spr_yeet, spr_yell];
act_index = irandom_range(0, array_length(possible_acts)-1);
sprite_index = possible_acts[act_index%array_length(possible_acts)];

player = noone;

SUPER = 0;
act_done = 0;
turn_sped = 0;
fight_rad = 240;