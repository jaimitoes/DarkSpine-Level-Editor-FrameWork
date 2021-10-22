/// @description Activate, make visible and play an inserted tween on child objects
function dks_child_activator() 
{
	// The parent object has the ability to activate a hierarchy...
	size = array_length(child);
	for (var i =0; i<size; i++)
	{
	 instance_activate_object(child[i]);
 
	 with(child[i])
	 {
	  if (have_tween)
	  {
   
	   TweenPlay(TweensTarget(id));
	  }
  
	  if(is_physics)
	  {
   
	   phyprops[| physics.active] = 1;
	   phy_active = 1;
	  }
  
	  if(parent)
	  {
	   dks_child_activator();
	  }
	 }
	}
}