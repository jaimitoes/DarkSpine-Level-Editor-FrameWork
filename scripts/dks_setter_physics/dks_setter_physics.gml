/// @description dks_setter_physics()
function dks_setter_physics() 
{
	// Update, set the physics properties from the editor.
	var press;
	// When the targeted object contains a physics properties structure
	if(target.is_physics)
	{
	 // When the inputboxes does not exists	
	 if (! input_created)
	 {
	  // Creates a set of input boxes for each physics variables	 
	  input_list = dks_input_list_create(menu_b_phy_int,target.phyprops,1);
	  // The input boxes exists
	  input_created = true;
	 } 
	 // These input boxes are always active
	 dks_input_set_active(input_list[| physics.shape],0);
	 dks_input_set_active(input_list[| physics.awake],0);
	 dks_input_set_active(input_list[| physics.sensor],0);
	 dks_input_set_active(input_list[| physics.kine],0);
	 dks_input_set_active(input_list[| physics.fixed_rotation],0);
	 dks_input_set_active(input_list[| physics.joint_type],0);
 
	 //Set the inputboxes data into the Deco phyprops structure
	 if mouse_check_button_released(mb_any) or keyboard_check_released(vk_anykey)
	 {
	  target.phyprops[| physics.dens]  = dks_input_get_text_real(input_list[| physics.dens]);
	  target.phyprops[| physics.rest]  = dks_input_get_text_real(input_list[| physics.rest]);
	  target.phyprops[| physics.group] = dks_input_get_text_real(input_list[| physics.group]);
	  target.phyprops[| physics.l_damp] = dks_input_get_text_real(input_list[| physics.l_damp]);
	  target.phyprops[| physics.a_damp] = dks_input_get_text_real(input_list[| physics.a_damp]);
	  target.phyprops[| physics.frict] = dks_input_get_text_real(input_list[| physics.frict]);
	  target.phyprops[| physics.radius] = dks_input_get_text_real(input_list[| physics.radius]);
	 }
 
	 if mouse_check_button_pressed(mb_left)
	 {
	  press = dks_button_press(menu_b_phy_int);
	  if (press != -1)
	  {
	   // Execute the script stored into the array "menu_b_phy_int" on the value 11, take a look...
	   //...at the scripts "dks_button_create" and "dks_button_reel_create" to see button storage structure.
	   switch (press)
	   {
		// Execute the script associated to the current button value   
	    case physics.shape: script_execute(menu_b_phy_int[physics.shape][11]);break;
	    case physics.awake: script_execute(menu_b_phy_int[physics.awake][11]);break;
	    case physics.sensor: script_execute(menu_b_phy_int[physics.sensor][11]);break;
	    case physics.kine: script_execute(menu_b_phy_int[physics.kine][11]);break;
	    case physics.fixed_rotation: script_execute(menu_b_phy_int[physics.fixed_rotation][11]);break;
	    case physics.joint_type: script_execute(menu_b_phy_int[physics.joint_type][11]);break;
	    case physics.active: script_execute(menu_b_phy_int[physics.active][11]);break;
	   }
	  }
	 }
	}

	if mouse_check_button_pressed(mb_left)
	{
	 // Add or Destroy a Physics structure. Check if we are click on the physics main menu button
	 press = dks_button_press(menu_b_phy_main)
	 if (press = 0)
	 {
	  // Execute the script associated with the physics main menu button	 
	  // Add or Destroy a Physics structure.
	  script_execute(menu_b_phy_main[0][11]);
	 }
	}

	if (mouse_check_button_pressed(mb_right))
	{
	 // While we are not hover any button of this structure	
	 press = dks_button_press(button_physics_mode);
	 if (press = -1)
	 {
	  // If a nearest object from our Deco object exists...	 
	  if (near != target) and (near != noone)
	  {
	   // If this object does not contains any physics properties	  
	   if (!near.is_physics)
	   {
		//Destroy the current input boxes   
	    dks_input_list_destroy(input_list);
		input_created = 0;
		// Set the info text of the physics button panel with the text: "ADD PHYSICS".
	    menu_b_phy_main[0][@10] = "ADD PHYSICS";
		// Set the new controlable target and exit from this block.
	    target = near;exit;
	   } 
	   else // If the nearest object is already a physics object
	   {
		// Destroy the current input boxes   
	    dks_input_list_destroy(input_list);
		input_created = 0;
		// Set the info text of the physics button panel with the text: "DESTROY PHYSICS"
	    menu_b_phy_main[0][@10] = "DESTROY PHYSICS";
		// Set the new controlable target and exit from this block.
	    target = near; exit;
	   }
	  }
	 }
	}
}