/// @description dks_particle_setter_update(object)
/// @param object
function dks_particle_setter_update(argument0) 
{

	with(argument0)
	{
	 if(object_index = obj_particle_system)
	 {
	  event_user(0);
	 } 
	 else 
	 {
	  if is_array(dk_part)
	  {
	   if(bind_target != noone)
	   {
	    dks_particle_setter_update(bind_target);
	   } 
	  }
	  /*Redundant Memory leak (solved for the next update)
	  else 
	  {
	   if(parent)
	   {
	    var s = array_length(child)
	    for(var i =0; i<s; i++)
	    {
	     dks_particle_setter_update(child[i]);
	    }
	   }
	  } 
	  */
	 }
	}  
}