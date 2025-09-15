depth = max(depth, other.depth + 1);
if (my_color == BLUE) {
	other.x += x-xprevious;
	other.y += y-yprevious;
	return;	
}