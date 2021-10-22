/// @description Under construction

if (target != noone)
{
 with(target) 
 {
  if(current_state = State.corner_grab)
  {
   if(!other.j_created)
   {
    phy_fixed_rotation = 0;
    phy_position_x = bind_target.phy_position_x;
    phy_position_y = bind_target.phy_position_y+sprite_yoffset-2;
    joint_id = physics_joint_revolute_create(id,bind_target,phy_position_x ,phy_position_y-sprite_yoffset,0,0,0,0,0,0,0);
    other.j_created = 1;
   }
  if(key_right)
  {
   with(bind_target)
   {
    physics_apply_force(x,y,100,0);
   }
  }
  else if(key_left)
  {
   with(bind_target)
   {
    physics_apply_force(x,y,-100,0);
   }
  }
  /*
  if(key_down)
  {
   xoffset+=1;
  }
  else if (key_up)
  {
   xoffset-=1;
  }*/
  
  
  if(key_jump)
  {
   bind_target = noone;
   physics_joint_delete(joint_id);
   current_state = State.jump2;
   phy_fixed_rotation = 1;
   physics_apply_impulse(x,y,phy_speed_x,-20);
   with(other.id)
   {
    j_created = 0;
    alarm[0] = 30;
    var s = array_length(child);
    for(var i = 0; i<s; i++)
    {
     child[i].is_physics = 0;
    }
    target = noone;
   }
  }
  
  }
 }
}
else
{
 if(parent)
 {
  var s = array_length(child);
  for(var i = 0; i<s; i++)
  {
   with(child[i])
   {
    if(is_physics)
    {
     if(place_meeting(x,y,obj_hero))
     {
      bind_target.target = obj_hero;
      physics_apply_impulse(x,y,obj_hero.phy_speed_x*2,0);
      with(obj_hero)
      {
       bind_target = other.id;
       //phy_active = 0;
       current_state = State.corner_grab;
       phy_position_x = bind_target.phy_position_x;
       phy_position_y = bind_target.phy_position_y+sprite_height;
       xoffset = 0;
       yoffset = 0;
      }
      break;
     } 
    }
   }
  } 
 }
}

/* */
/*  */
