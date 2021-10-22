if(depth = object_place.depth)
{
 if !TweenExists(tween_path)
 {
  if place_meeting(x,y,object_place)
  {
   if(object_target.is_physics)
   {
    with(object_target)
    {
     phy_active = 0;
     current_state = State.path;
     var xf = phy_position_x - phy_com_x;
     var yf = phy_position_y - phy_com_y;
     phy_position_x = other.x +xf;
     phy_position_y = other.y +yf;
    } 
    tween_path = TweenPathPhy(object_target,ease , Mode,0,0,Dur,_path,0);
    TweenAddCallback(tween_path,TWEEN_EV_FINISH,object_target,dks_state_switch,object_target,State.fall);
   }
   else
   {
    tween_path = TweenPath(object_target,ease , Mode,0,0,Dur,_path,0);
   }
   tween_exists = 1;
   if(destroy)
   {
    TweenAddCallback(tween_path,TWEEN_EV_FINISH,object_target, dks_instance_destroy, id);
   } 
  }
 }
}

