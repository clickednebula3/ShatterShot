grappled_soul = other;
instance_destroy(other.purplayer_my_purpellet);
if (strong_grapple) { other.death_cause = owner; instance_destroy(other); count_for_combo(owner, 1); }