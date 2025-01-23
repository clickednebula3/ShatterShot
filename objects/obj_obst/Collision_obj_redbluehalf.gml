if (my_color == BLUE) {
	other.x += x-xprevious;
	other.y += y-yprevious;
	return;	
}


if (!other.visible) { return; }

if (my_color == c_green) { other.owner.HP++; instance_destroy(); return; }

if (my_color == c_aqua) {
	if (abs(other.x-other.xprevious) > 1.2 || abs(other.y-other.yprevious) > 1.2) { soul_hit(other.owner); }
	return;
}

if (my_color == c_orange) {
	if (other.x == other.xprevious && other.y == other.yprevious) { soul_hit(other.owner); }
	return;
}

if (my_color == c_aqua && is_array(other.owner.my_color)) { return; }

soul_hit(other.owner);