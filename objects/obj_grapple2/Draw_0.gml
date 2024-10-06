image_alpha = 0.8 + 0.2*strong_grapple;
draw_self();
if (instance_exists(owner)) { draw_line(x, y, owner.x, owner.y); }