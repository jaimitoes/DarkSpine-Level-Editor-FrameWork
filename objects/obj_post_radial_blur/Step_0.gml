if(alarm[0] > blur)
{
 blur_offset += 0.002;
}
else
{
 blur_offset -= 0.002;
}

if instance_exists(obj_hero)
{
 with(obj_hero)
 {
  var xf = phy_position_x - phy_com_x;
  var yf = phy_position_y - phy_com_y;
  other.pos_x = (x+xf) - camera_get_view_x(Cam);
  other.pos_y = (y+yf) - camera_get_view_y(Cam);
 } 
}



