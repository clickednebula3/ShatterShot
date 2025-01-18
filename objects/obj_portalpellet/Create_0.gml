speed = 10;
direction = 45;


portal_id = PORTAL_ID.A;
big_mode = true;

timer = 0;
function peripheral_x() { return x+16*dcos(timer)*dcos(direction+90); }
function peripheral_y(off) { return y-16*dsin(timer+off)*-dsin(direction+90); }