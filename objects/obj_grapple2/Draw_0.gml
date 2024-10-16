image_alpha = 0.8 + 0.2*strong_grapple;
draw_self();
var _color = c_white;
if (strong_grapple) { _color = c_maroon; }
if (instance_exists(grappled_soul)) { _color = c_gray; }
draw_set_color(_color);
if (instance_exists(owner)) { draw_line(x, y, owner.x, owner.y); }