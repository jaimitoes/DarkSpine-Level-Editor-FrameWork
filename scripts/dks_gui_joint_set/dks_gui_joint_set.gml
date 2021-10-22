function dks_gui_joint_set() 
{
	if(!target.is_physics)
	{
	 dks_message("The current target is not a physcis object, go to <PHYSICS PROPS> to add physics.");exit;
	}
	if (target.phyprops[| physics.joint_type] = "disabled")
	{
	 dks_message("The current target does not have a defined joint, go to <PHYSICS PROPS> to add joint.");exit;
	}
 menu_setters = setter.joint;
}