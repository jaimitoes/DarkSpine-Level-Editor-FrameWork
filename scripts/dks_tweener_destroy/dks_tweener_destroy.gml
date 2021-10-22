function dks_tweener_destroy() 
{
	if(obj_deco_creator.modo != mode.animator)
	{
	 if instance_exists(obj_motion_controller)
	 {
	  with(obj_motion_controller)
	  {
	   instance_destroy();
	  }
	  dks_tween_stop(obj_deco);
	  dks_tweener_tween_reset(obj_deco);
	 }
	}
}