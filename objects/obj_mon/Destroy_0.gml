var my_death_particle = instance_create_depth(x, y, depth, obj_mon_break);
my_death_particle.image_angle = image_angle;
my_death_particle.my_color = my_color;
my_death_particle.direction = direction;
my_death_particle.speed = speed*0.1;
global.score++;

instance_destroy(purples_strings_makes_them_ring_a);
instance_destroy(purples_strings_makes_them_ring_b);
instance_destroy(purplayer_my_purpellet);
audio_play_sound(snd_shatter, 10, false, 1, 0, 1+random_range(-0.1, 0.1));

if (instance_exists(death_cause) && death_cause.object_index == obj_player && my_color == c_green) { soul_heal(death_cause, 1); }