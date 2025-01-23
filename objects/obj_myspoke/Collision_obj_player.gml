if (other.speed > obj_mon_spawner.unhandlable_pure_speed) {
	var success = myspoke_hurt(other, 1);
	if (success) { count_for_combo(other, 1); }
	return;
}

if (instance_exists(other)) {
	soul_hit(other, noone, 1/sec, true);
}