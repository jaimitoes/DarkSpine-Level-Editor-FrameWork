if(parent)
{
 with(child[0])
 {
  if(joint)
  {
   physics_joint_delete(joint_id);
   joint_target = noone;
   joint = false;
  } 
 }
 instance_destroy();
}

