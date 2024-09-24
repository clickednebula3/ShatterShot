var col = c_white;
if (instance_exists(owner)) { col = owner.my_color; }

draw_sprite_ext(sprite_index, image_index, x-hspeed*2, y-vspeed*2, image_xscale, image_yscale, image_angle, col, image_alpha/4);
draw_sprite_ext(sprite_index, image_index, x-hspeed, y-vspeed, image_xscale, image_yscale, image_angle, col, image_alpha/2);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, col, image_alpha);