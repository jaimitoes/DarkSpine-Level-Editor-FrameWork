function dks_setter_joint() 
{
	if (instance_number(obj_deco)>1)
	{

	if (mouse_check_button_pressed(mb_right))
	{
 
	 if (near !=noone) and (near!= target)
	 {
	  if (near.is_physics)
	  {
	   if (near.phyprops[| physics.joint_type] != "disabled")
	   {
	    dks_input_list_destroy(input_list);
		input_created = 0;
	    target = near;exit;
	   }
	   else
	   {
	    dks_message("The current selection does not have joint properties.");
	   }
	  }
	  else
	  {
	   dks_message(" The current selection does not have physics properties.");
	  }
	 }
	} 

	if mouse_check_button_pressed(mb_left)
	{
	 var press = dks_button_press(menu_b_joint)
	 {
	  if (press = 1)
	  {
	   script_execute(menu_b_joint[1,11]);
	  }
	 }
	}

	if(target.joint)
	{
	 if(joint_target_set)
	 {
	  if mouse_check_button_pressed(mb_left)
	  {
   
	   if (near !=noone) and (near!= target)
	   {
	    scr_joint_target_set(target,near);
   
	    exit;
	   }
	  } 
  
	  if (not instance_exists(obj_msn))
	   {
	   dks_message("Select a target with mouse left click");
	   }
	 }
	 else
	 {
	  switch(target.phyprops[| physics.joint_type])
	  {
	   case "Joint distance": dks_setter_joint_distance();break;
	   case "Joint rope": dks_setter_joint_rope();break;
	   case "Joint revolute": dks_setter_joint_revolute();break;
	   case "Joint prismatic": dks_setter_joint_prism();break;
	   case "Joint pulley":  dks_setter_joint_pulley();break;
	   case "Joint friction":  dks_setter_joint_friction();break;
	   case "Joint gear": dks_setter_joint_gear();break;
	   case "Joint weld": dks_setter_joint_weld();break;
	   case "Joint wheel": dks_setter_joint_wheel();break;
	  }
	 }
	}
	else
	{ 
 
	  if mouse_check_button_pressed(mb_left)
	  {
   
	   if (near !=noone) and (near!= target)
	   {
	    scr_joint_target_set(target,near);
   
	    exit;
	   }
	  } 
  
	   if (not instance_exists(obj_msn))
	   {
	    dks_message("Select a target with mouse left click");
	   }
	 }
	}
	else
	{
	 dks_message("At least 2 instance must be exists");
	 menu_setters = setter.closed;
	}
}