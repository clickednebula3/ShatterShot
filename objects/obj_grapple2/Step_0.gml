speed *= 0.94;
Time++;
image_angle = 3*Time+3*x+1.5*y;
x = clamp(x, x-bbox_left-1, room_width-(bbox_right-x)+1);
y = clamp(y, y-bbox_top-1, room_height-(bbox_bottom-y)+1);