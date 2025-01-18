draw_set_color(c_red);
draw_circle(x, y, radius, true);
draw_sprite_ext(spr_obst_basic, 1, x, y, 4*image_xscale, 4*image_yscale, 0, c_red, image_alpha);
draw_set_color(c_white);