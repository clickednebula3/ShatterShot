if (gen_depth > 0 && !instance_exists(my_child)) {
	my_child = instance_create_depth(x+rad*dcos(image_angle), y-rad*dsin(image_angle), depth, object_index);
	my_child.my_parent = self;
	my_child.gen_depth = gen_depth - 1;
}