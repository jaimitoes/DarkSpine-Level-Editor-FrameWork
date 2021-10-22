function dks_gui_physics_set_props() 
{
	with(target)
	{
	 if (is_physics)
	 {
	  if(joint)
	  {
	   if ds_exists(joint_list, ds_type_list)
	   {
	    ds_list_destroy(joint_list);
	   }
	   if ds_exists(joint_offset, ds_type_list)
	   {
	    ds_list_destroy(joint_offset);
	   } 
	   joint = false;
	   joint_target = noone;
	  }
	  ds_list_destroy(phyprops);
	  is_physics = false;
	  other.menu_b_phy_main[0][@10] = "ADD PHYSICS";
	  with(other.id)
	  {	  
	   dks_input_list_destroy(input_list);
	   input_created = 0;
	  }
  }
	 else
	 {
	  dks_phyprops_create();
	  other.menu_b_phy_main[0][@10] = "DESTROY PHYSICS";
	 }
	}
}