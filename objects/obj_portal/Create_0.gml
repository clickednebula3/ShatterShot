enum PORTAL_ID { A, B }

portal_id = PORTAL_ID.A;
clings_to = noone;
linked_portal = noone;
my_color = c_orange;
//cam = camera_create();

timer = 0;
function peripheral_x(off) { return x+32*dcos(timer*123+off)*dcos(image_angle+90); }
function peripheral_y(off) { return y-32*dsin(timer*123+off)*-dsin(image_angle+90); }