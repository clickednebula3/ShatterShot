if (instance_exists(other.owner) && other.owner.object_index == obj_player) { myspoke_hurt(other); }
instance_destroy(other);