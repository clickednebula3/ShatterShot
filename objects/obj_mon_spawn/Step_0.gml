if (alarm[0] > 0) {
	image_alpha = 0.5 + 0.25*dsin(current_time/3);
}
else if (alarm[1] > 0) {
	image_alpha = 1;
	image_xscale = 1 + (alarm[1] / sec*0.5);
	image_yscale = 1 + (alarm[1] / sec*0.5);
}