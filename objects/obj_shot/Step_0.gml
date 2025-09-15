speed *= 1.02;
//speed = lerp(speed, 30, 0.1);


//if (image_index = 1) { image_xscale = 1.5; image_yscale = 1.5; }
//if (speed > 12) { speed = 0; }
image_angle = direction;

if (speed > 500) { instance_destroy();}