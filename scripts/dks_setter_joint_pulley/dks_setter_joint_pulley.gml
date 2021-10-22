/// @description scr_menu_joint_pulley();
function dks_setter_joint_pulley() 
{
 // The script "dks_button_press" check if the mouse are hover a button structure...
	var p1 = dks_button_press(menu_b_joint);   
	var p2 = dks_button_press(button_physics_mode);
	var p3 = dks_button_press(menu_b_joint_pulley_info);
	var p4 = dks_button_press(menu_b_joint_pulley_int);
       
	// Creating the input boxes
	if (! input_created)
	{
	 // Create a list of inputboxes for the joint pulley settings.
	 input_list = dks_input_list_create(menu_b_joint_pulley_int,target.joint_list,1);
	 // Set to true that the inputboxes exists.
	 input_created = true;
	}

	// IF THE MOUSE AREN´T HOVER ANY BUTTON
	if (p1 = -1) and (p2 = -1) and (p3 = -1) and (p4 =-1)
	{ 
	with(target)
	 {
	  if (!keyboard_check(vk_control)) // While we are not pressing the CONTROL key
	  {
	   // Set the coordinates of the first world anchor point  	  
	   if mouse_check_button_pressed(mb_left)
	   {
	    joint_list[| e_joint_pulley.w_anchor1_x] = other.Mxd-x;
	    joint_list[| e_joint_pulley.w_anchor1_y] = other.Myd-y;
		// Get the offset of the first point relative to our Deco object.
	    joint_offset[| 0] = scr_bind_set_xoffset(id,joint_list[| 0],joint_list[| 1]);
	    joint_offset[| 1] = scr_bind_set_yoffset(id,joint_list[| 0],joint_list[| 1]);
	   }
   
	   if mouse_check_button(mb_left)
	   {
		// Set the coordinates of the second world anchor point  	     
	    joint_list[| e_joint_pulley.w_anchor2_x] = other.Mxd-x;
	    joint_list[| e_joint_pulley.w_anchor2_y] = other.Myd-y;
	    // Get the offset of the second point relative to our Deco object.
	    joint_offset[| 2] = scr_bind_set_xoffset(id,joint_list[| 2],joint_list[| 3]);
	    joint_offset[| 3] = scr_bind_set_yoffset(id,joint_list[| 2],joint_list[| 3]); 
	   }
	  }
	  else  // While we are pressing the CONTROL key
	  { 
	   // Set the coordinates of the third world anchor point  	  	  
	   if mouse_check_button_pressed(mb_left)
	   {
	    joint_list[| e_joint_pulley.l_anchor1_x] = other.Mxd-x;
	    joint_list[| e_joint_pulley.l_anchor1_y] = other.Myd-y;
	    // Get the offset of the third point relative to our Deco object.  
	    joint_offset[| 4] = scr_bind_set_xoffset(id, joint_list[| 4], joint_list[| 5]);
	    joint_offset[| 5] = scr_bind_set_yoffset(id, joint_list[| 4], joint_list[| 5]);
	   }
   
	   if mouse_check_button(mb_left)
	   {
		// Set the coordinates of the fourth world anchor point    
	    joint_list[| e_joint_pulley.l_anchor2_x] = other.Mxd - joint_target.x;
	    joint_list[| e_joint_pulley.l_anchor2_y] = other.Myd - joint_target.y;
	    // Get the offset of the fourth point relative to our Deco object.
	    joint_offset[| 6] = scr_bind_set_xoffset(joint_target,joint_list[| 6],joint_list[| 7]);
	    joint_offset[| 7] = scr_bind_set_yoffset(joint_target,joint_list[| 6],joint_list[| 7]); 
	   }
	  }
	 }
	 // Check if an input box is active
	 var act = dks_input_list_get_active(input_list)
	 if(!act)
	 { 
	  // Update the inputboxes from the Deco joint list structure
	  dks_input_list_set_text(input_list, target.joint_list);
	 }
	}   

	// Setting up input values and storing this into the Deco object
	if keyboard_check_released(vk_anykey)
	{
	  var act = dks_input_list_get_active(input_list)
	  if(act)
	  { 
	   // Transfer the input boxes data into the joint list structure of our Deco object.	  
	   dks_input_list_transfer_real(target.joint_list,input_list);
	   // Get the offset of our joint coordinates relative from the Deco object.
	   with(target)
	   {
	    joint_offset[| 4] = scr_bind_set_xoffset(id,joint_list[| 4],joint_list[| 5]);
	    joint_offset[| 5] = scr_bind_set_yoffset(id,joint_list[| 4],joint_list[| 5]);
	    joint_offset[| 6] = scr_bind_set_xoffset(joint_target,joint_list[| 6],joint_list[| 7]);
	    joint_offset[| 7] = scr_bind_set_yoffset(joint_target,joint_list[| 6],joint_list[| 7]);  
	   }
	 } 
	}
}