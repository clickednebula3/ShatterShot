grappled_soul = other;
instance_destroy(other.purplayer_my_purpellet);
if (strong_grapple) { instance_destroy(other); count_for_combo(owner, 1); }