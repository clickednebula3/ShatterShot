my_parent = noone;
my_child = noone;
gen_depth = 10+irandom_range(-2, 2);
rad = sprite_width;//32px
redness = 0;


immune_to = [];
de_immunize_players = sec;

alarm[0] = sec;

function immunize_against(_obj) {
	var _childmost = self;
	while (instance_exists(_childmost.my_child) && _childmost.my_child.object_index == obj_myspoke)
	{ _childmost = _childmost.my_child; }
	
	var _parentmost = _childmost;
	while (instance_exists(_parentmost.my_parent) && _parentmost.my_parent.object_index == obj_myspoke)
	{
		if (!array_contains(_parentmost.immune_to, _obj)) { array_push(_parentmost.immune_to, _obj); }
		_parentmost = _parentmost.my_parent;
	}
	
	if (!array_contains(_parentmost.immune_to, _obj)) { array_push(_parentmost.immune_to, _obj); }
}

function myspoke_hurt(_obj, _dmg = 1, immunization_chance = 1) {
	if (instance_exists(_obj) && array_contains(immune_to, _obj)) { return false; }
	if (immunization_chance >= random_range(0, 1)) { immunize_against(_obj ); }
	
	var _childmost = self;
	while (instance_exists(_childmost.my_child) && _childmost.my_child.object_index == obj_myspoke)
	{ _childmost = _childmost.my_child; }
	
	var _parentmost = _childmost;
	var _dmg_counter = 1;
	while (instance_exists(_parentmost.my_parent) && _parentmost.my_parent.object_index == obj_myspoke)
	{
		var _last_parentmost = _parentmost;
		_parentmost = _last_parentmost.my_parent;
		_parentmost.gen_depth-=_dmg;
		if (_last_parentmost.gen_depth<0) { instance_destroy(_last_parentmost); }
	}
	
	if (_parentmost.gen_depth<0) { instance_destroy(_parentmost); }
	instance_destroy(_childmost);
	
	if (instance_exists(_parentmost)) { _parentmost.redness = 1; }
	
	return true;
}