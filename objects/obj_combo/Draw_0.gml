draw_set_alpha(0.5);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (!is_array(my_color)) { draw_set_color(my_color); }
x = clamp(x, 64, room_width-64);
y = clamp(y, 16, room_width-16);

draw_set_font(fnt_yeon);
//draw_set_font(fnt_ol_reliable);
draw_text(x, y, string(combo)+"xCOMBO");

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);