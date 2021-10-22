if is_array(variables)
{
 if(parent)
 {
  //burst script (obj_particle_system)
  
  with(child[0])
  {
   variables[0] = other.variables[0];
   event_user(0);
  } 
 }
 instance_destroy();
}



