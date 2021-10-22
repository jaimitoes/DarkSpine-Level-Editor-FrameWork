if(perform_event !=-1)
{
 
 if(other.phy_speed_y>1) and (other.can_jump)
 {
  if(child_path)
  {
   if !TweenExists(tween_path)
   {
    with(other.id)
    {
     can_jump = 0;
     phy_active = 0;
     current_state = State.path;
     var xf = phy_position_x - phy_com_x;
     var yf = phy_position_y - phy_com_y;
     phy_position_x = other.childx +xf;
     phy_position_y = other.childy +yf;
    } 
     
    tween_path = TweenPathPhy(other.id,child_ease , child_mode,0,0,child_dur,_path,0);
    TweenAddCallback(tween_path,TWEEN_EV_FINISH,other.id,dks_state_switch,other.id,State.fall);
    if(childz)
    {
     TweenFire(other.id,child_ease,child_mode,0,0,child_dur,"depth",other.depth,_depth);
     other.phyprops[| physics.group] = Group;
     TweenFire(cam_target,EaseOutSine,0,0,delay,z_dur,"z",cam_target.z, _depth);
     alarm[0] = dur/2;
     if(os_type != os_android)
    {
     effect = instance_create_depth(0,0,0,obj_post_radial_blur);
     effect.blur = dur/2;
     effect.alarm[0] = dur;
    } 
    } 
   }
  }
  else
  {
   other.current_state = State.jump2;
   other.phyprops[| physics.group] = Group;
   with(other.id)
   {
    physics_apply_impulse(phy_collision_x,phy_collision_y,0,other.jumpforce);
   } 
   if(z_dur!=-1) and instance_exists(cam_target)
   {
    TweenFire(other.id,EaseInSine,0,0,0,dur,"depth",other.depth,_depth);
	cam3dswitch = cam_target._3d;
	cam_target._3d = 0;
    TweenFire(cam_target,EaseOutSine,0,0,delay,z_dur,"z",cam_target.z, _depth);
    alarm[0] = dur/2;
    if(os_type != os_android)
    {
     effect = instance_create_depth(0,0,0,obj_post_radial_blur);
     effect.blur = dur/2;
     effect.alarm[0] = dur;
    } 
   } 
  }    
 }
}

