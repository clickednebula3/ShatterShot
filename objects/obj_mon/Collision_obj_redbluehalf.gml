if (!other.visible) { return; }

if (other.speed > obj_mon_spawner.unhandlable_pure_speed) { count_for_combo(other.owner, 1); if (my_color == c_green) { soul_heal(other.owner, 1); } instance_destroy(); return; }
if (my_color == c_green) { count_for_combo(other.owner, 1); if (my_color == c_green) { soul_heal(other.owner, 1); } instance_destroy(); return; }

if (!instance_exists(purplayer_my_purpellet)) { count_for_combo(other.owner, 1); if (my_color == c_green) { soul_heal(other.owner, 1); } instance_destroy(); return; }

if (my_color == c_aqua) {
	if (abs(other.x-other.xprevious) > 1.2 || abs(other.y-other.yprevious) > 1.2) {  soul_hit(other.owner); }
	return;
}
if (my_color == c_orange) {
	if (other.x == other.xprevious && other.y == other.yprevious) { soul_hit(other.owner); }
	return;
}

soul_hit(other.owner);