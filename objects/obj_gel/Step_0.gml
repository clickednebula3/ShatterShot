var _coll = ds_list_create();
var _coll_c = collision_circle_list(x, y, radius, [obj_player], false, true, _coll, false);

for (var i=0; i<_coll_c; i++) {
	with (_coll[|i]) { speed += 0.2; }
}

ds_list_destroy(_coll);