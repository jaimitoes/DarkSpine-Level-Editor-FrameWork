event_inherited();

if (tween_exists)
{
  if(tween_z)
  {
   TweenFire(object_target,ease,Mode,0,0,Dur,"depth",object_target.depth,_depth);
   tween_z = 0;
  }
  part_system_depth(part_system.ps_system,object_target.depth);
  part_system.burst_script = dks_null;
  for( i = 0; i<s; i++)
  { 
   if place_meeting(x,y,ob_id[i]) and (!ob_id[i].visible)
   {
    var xx = abs(x-ob_id[i].x);
    var yy = abs(y-ob_id[i].y);
    if(xx<8) and (yy<8) 
    {
     ob_id[i].visible = 1;
     ob_id[i].depth = depth;
     part_system.burst_script = dks_particle_burst;
    } 
   }
  }
}

