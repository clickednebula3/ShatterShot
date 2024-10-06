if (!other.visible) { return; }

if (other.speed > obj_mon_spawner.unhandlable_pure_speed) { instance_destroy(); return; }
if (my_color == c_green) { instance_destroy(); return; }

if (!instance_exists(purplayer_my_purpellet)) { instance_destroy(); return; }

if (my_color == c_aqua) {
	if (abs(other.x-other.xprevious) > 1.2 || abs(other.y-other.yprevious) > 1.2) {with (other.owner) { soul_hit(); }}
	return;
}
if (my_color == c_orange) {
	if (other.x == other.xprevious && other.y == other.yprevious) {with (other.owner) { soul_hit(); }}
	return;
}


with (other.owner) { soul_hit(); }