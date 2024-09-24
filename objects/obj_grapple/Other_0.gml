if (!finished) {
	speed *= -1;
	px = x;
	py = y;
	x = xstart;
	y = ystart;
	finished = true;
} else {
	speed = 0;
}