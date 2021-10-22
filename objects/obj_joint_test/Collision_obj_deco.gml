///Create a joint from this object to the collided Deco object
 if mouse_check_button(mb_left)
 {
  if(!joint_created)
  {
   joint_id = physics_joint_rope_create(id,other.id,x,y,Mxd,Myd,100,false);
   joint_created = true;
  }
 } 


