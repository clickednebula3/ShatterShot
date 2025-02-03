if (SUPER > 0) { return; }
if (!image_index) { audio_play_sound(snd_squeak, 10, false); }
image_index = 1;
speed *= 0.98;