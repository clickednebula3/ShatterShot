if (my_color == c_blue) {
	other.x += x-xprevious;
	other.y += y-yprevious;
	other.gravity = 0;
	return;	
}


if (my_color == c_green) { other.HP++; instance_destroy(); return; }

if (other.my_color == c_white) { return; }
if (other.my_color == c_aqua && other.aqua_move_meter >= 1.5*sec) { return; }

if (my_color == c_aqua) {
	if (abs(other.x-other.xprevious) > 1.2 || abs(other.y-other.yprevious) > 1.2) { with (other) { soul_hit(); }}
	return;
}

if (my_color == c_orange) {
	if (other.x == other.xprevious && other.y == other.yprevious) {with (other) { soul_hit(); }}
	return;
}

if (my_color == c_red && is_array(other.my_color)) { return; }

with (other) { soul_hit(); }