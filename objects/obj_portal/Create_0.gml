enum PORTAL_ID { A, B }

portal_id = PORTAL_ID.A;
linked_portal = noone;
my_color = c_orange;
//cam = camera_create();

timer = 0;
function peripheral_x(off) { return x+32*dcos(timer+off)*dcos(image_angle+90); }
function peripheral_y(off) { return y-32*dsin(timer+off)*-dsin(image_angle+90); }