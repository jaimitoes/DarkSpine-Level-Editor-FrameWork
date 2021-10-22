function dks_gui_physics_set() 
{
	if(target != noone)
	{
	 if(target.is_physics)
	 {
	  menu_b_phy_main[0][@10] = "DESTROY PHYSICS";
	 }
	 else
	 {
	  menu_b_phy_main[0][@10] = "ADD PHYSICS";
	 }
	 menu_setters = setter.physet;
	}
	else
	{
	 dks_message("First, you must to select an object")
	}
}