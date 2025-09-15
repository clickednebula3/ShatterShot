if (other.speed > obj_mon_spawner.unhandlable_pure_speed) {
	count_for_combo(other, 1);
	if (my_color == c_green) { soul_heal(other, 1); }
	direction = other.speed;
	if (other.my_color == c_orange || other.my_color == c_aqua) { other.aqua_stunned = false; other.aqua_move_meter += sec; }
	speed = other.speed * 0.5;
	other.speed *= 1.2;//make positive
	instance_destroy();
	return;
}
if (my_color == c_green) { count_for_combo(other, 1); if (my_color == c_green) { soul_heal(obj_player, 1); } instance_destroy(); return; }

if (other.my_color == c_green && my_color != c_purple && my_color != c_orange &&
	!instance_exists(other.green_shield) && other.cayote_time_for_speed <= 0 &&
	(other.green_allround_shield || abs( point_direction(other.x, other.y, x, y) - other.gravity_direction) < 60))
{ direction = other.gravity_direction; gravity_direction = other.gravity_direction; speed = 10; return; }

if (!instance_exists(purplayer_my_purpellet)) { count_for_combo(other, 1); if (my_color == c_green) { soul_heal(other, 1); } instance_destroy(); return; }
if (other.my_color == c_purple) { orngplayer_tension++; orngplayer_tension = min(orngplayer_tension, orngplayer_tension_max); }

if (other.my_color == c_white && my_color == c_red) { count_for_combo(other, 1); if (my_color == c_green) { soul_heal(other, 1); } instance_destroy(); return; }
if (other.my_color == c_white && (my_color != c_orange && my_color != c_aqua)) { return; }

if (other.my_color == c_aqua && other.aqua_move_meter >= 1.5*sec)
{ instance_destroy(); other.aqua_move_meter = -sec/2; other.aqua_stunned = true; return; }

if (my_color == c_aqua) {
	//if (abs(other.x-other.xprevious) > 1.2 || abs(other.y-other.yprevious) > 1.2) { soul_hit(other); }
	return;
}
if (my_color == c_orange) {
	//if (other.x == other.xprevious && other.y == other.yprevious) { soul_hit(other); }
	return;
}


soul_hit(other);