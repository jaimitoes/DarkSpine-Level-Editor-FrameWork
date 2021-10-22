/// @description dks_setter_joint_gear()
function dks_setter_joint_gear() 
{
 //Check if the inputboxes are created, if not, get the data of our Deco joint list structure...
	//...to create each one.
	if (! input_created)
	{
	 // Create a set of inputboxes getting the joint list Deco data	
	 input_list = dks_input_list_create(menu_b_joint_gear_int,target.joint_list,1);
	 // Set the Id of the joint target object into the first value
	 dks_input_set_text(input_list[| 0], string(target.joint_target));
	 // Set to true that our object contains a joint
	 input_created = true;
	}

	// The first 2 input boxes are always active.
	dks_input_set_active(input_list[| 0],0);
	dks_input_set_active(input_list[| 1],0);
	// Check the other.id input boxes
	if (mouse_check_button_released(mb_any)) or keyboard_check_released(vk_anykey)
	{
	  //Check if the third inputbox is active
	  var active = dks_input_get_active(input_list[| 2]);
	  if (active)
	  {
	   // Update the joint structure of our Deco object	  
	   target.joint_list[| 2] = dks_input_get_text_real(input_list[| 2]);
	  }
	}
	// With the Deco object
	with(target)
	{
	 if mouse_check_button_pressed(mb_left)
	 {
	  // While we are not hover any button	 
	  var press = dks_button_press(other.menu_b_joint_gear_int);
	  if (press = -1)
	  {
	   //Get the nearest Deco object relative to the target	  
	   var tj = other.near;
	   // When the object closest to our target exists, and it is not part of any joint structure
	   if (tj !=noone) and (tj !=joint_target) and (tj != id)
	   {
		// If the object closest to our target contains a Revolute joint or a Prismatic Joint   
	    if (tj.phyprops[| physics.joint_type] = "Joint revolute") or (tj.phyprops[| physics.joint_type] = "Joint prismatic")
	    {
		 // Set the second ID of our joint gear structure.	
	     joint_list[| 1] = tj;
	    } 
	    else
	    {
		 // Send a message telling us the need of a secondary object setted as a prismatic/revolute joint.	
	     dks_message(" One object with a defined revolute/primatic joint must be selected!!");
	    }
	   }
	   else
	   {
		//When the conditional is not fulfilled...That means you can´t choose the current selection to create a Gear joint structure
	    dks_message(" The second joint object can not be the same of first object");
	   }
	  } 
	 }
	} 
}