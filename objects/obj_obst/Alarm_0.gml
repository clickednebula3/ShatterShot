//if outside room
//kill

if (x < -200 || x > room_width+200 || y < -200 || y > room_height+200) { instance_destroy(); }


alarm[0] = sec;