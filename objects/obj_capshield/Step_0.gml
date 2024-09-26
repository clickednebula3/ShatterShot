image_angle += rspd + rspd_diff*dsin(current_time/8);

if (returning) { gravity_direction = point_direction(x, y, owner.x, owner.y); gravity = 0.6; }

if (speed > 10) { speed *= 0.98; } else { speed *= 0.97; }