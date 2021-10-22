/// @description scr_menu_joint_weld();
function dks_setter_joint_weld() 
{
 // The script "dks_button_press" check if the mouse are hover a button structure...
	var p1 = dks_button_press(menu_b_joint);   
	var p2 = dks_button_press(button_physics_mode);
	var p3 = dks_button_press(menu_b_joint_weld_info);
	var p4 = dks_button_press(menu_b_joint_weld_int);

	// Creating the input boxes
	if (! input_created)
	{
	 // Create a list of inputboxes for the joint weld settings.	
	 input_list = dks_input_list_create(menu_b_joint_weld_int,target.joint_list,1);
	 // Set to true that the inputboxes exists.
	 input_created = true;
	}
	// IF THE MOUSE AREN´T HOVER ANY BUTTON   
	if (p1 = -1) and (p2 = -1) and (p3 = -1) and (p4 =-1)
	{
	 with(target)
	 {
	  if (!keyboard_check(vk_control))
	  { 
	   if mouse_check_button(mb_left)
	   {
	    var press = dks_button_press(other.menu_b_joint_weld_int);
	    if (press = -1)
	    {
	     joint_list[| e_joint_weld.anchor_x] = global.mouse_xd-x;
	     joint_list[| e_joint_weld.anchor_y] = global.mouse_yd-y;
	     if not ds_exists(joint_offset, ds_type_list)
	     {
	      joint_offset = ds_list_create();
	     }
	     joint_offset[| 0] = scr_bind_set_xoffset(id, joint_list[| 0], joint_list[| 1]);
	     joint_offset[| 1] = scr_bind_set_yoffset(id, joint_list[| 0], joint_list[| 1]);
	    }
	   }
	  }
	  else // While we are pressing the CONTROL key...
	  { 
	   if (mouse_check_button_pressed(mb_left))
	   {
	    if (other.near !=noone) //If the nearest Deco object exists...
	    {
		 // Set the second id of our joint		
	     joint_target = other.near;
		 // This variable comes true when a joint structure is complete.
	     joint = true;
	    }
	    else // If the nearest  object does not exists
	    {
	     // If our joint structure is not completly setted, the joint data is ignored by our Deco object 	
	     joint_target = noone;// Set to noone the second target
	     joint = false; // The Deco object does not contains any joint.
	    }
	   }   
	  }
	 } 
	 // Check if an inputbox is active from a list of inputboxes
	 var act = dks_input_list_get_active(input_list)
	 if(! act)
	 { 
	  //Update the inputboxes values from the joint list structure of our Deco object	 
	  dks_input_list_set_text(input_list, target.joint_list);
	 }
	}

	// Update the Deco joint list structure while an input is active
	if keyboard_check_released(vk_anykey)
	{
	 // Check if any input is active	
	 var act = dks_input_list_get_active(input_list)
	 if( act)
	 { 
	  //Update the Deco joint list	 
	  dks_input_list_transfer_real(target.joint_list,input_list);
	 }  
	}
}