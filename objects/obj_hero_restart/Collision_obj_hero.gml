with(other.id)
{
 with(instance_create_depth(0,0,0,obj_post_radial_blur))
 {
  alarm[0] = 40;
 }
 phy_position_x = xstart;
 phy_position_y = ystart;
 xscale = 1;
 depth = -1;
 current_state = State.fall;
 phyprops[| physics.group] = 1;
 
 
 with(obj_deco)
{
 if (is_physics)
 {
 if(phyprops[| physics.group] = 1)
  {
   phy_active = 1;
  }
  else
  {
   phy_active = 0;
  }
 }
}

if(instance_exists(cam_target))
 {
  with(cam_target)
  {
   
   TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,0,0,40,"z",z, target.depth);
  }
 }
}

