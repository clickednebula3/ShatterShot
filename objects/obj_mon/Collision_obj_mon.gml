//hspeed = (hspeed+other.hspeed)/1.9;
//vspeed = (vspeed+other.vspeed)/1.9;

//var vsp = vspeed;
//hspeed = -vspeed;
//vspeed = -vsp;


//if (abs(other.y-y) > abs(other.x-x)) {
//	y += 2*((other.y-y)/abs((other.y-y)));
//} else {
//	x += 2*((other.x-x+0.01)/abs((other.x-x)));
//}

var ang = point_direction(other.x, other.y, x, y);
x+=dcos(ang)*0.5;
y-=dsin(ang)*0.5;