function dks_level_play() 
{
	//Start the level simulation, decoding all the previous data inserted from the editor
	//N1 LOOP:
	// Creating physics when is needed...
	with (obj_deco)
	{
	 // Set the initial coordinates 	
	 xstart = x;
	 ystart = y;
	 // Set if is visible with this default Deco custom variable
	 visible = is_visible;
	 // If is physics, creates the fixture properties assigned from the editor
	 if (is_physics)
	 {
	  dks_physics_create();
	  // If a Deco object is physics, we must to update the Tween data to make it compatible
	  if (have_tween)
	  {
	   dks_tween_phy_update(id);
	  }
	  // Set if our deco object contains a fixed rotation
	  phy_fixed_rotation = phyprops[| physics.fixed_rotation];
	  // Set if our deco object starts active
	  phy_active = phyprops[| physics.active];
	 }
	} 
	//N2 LOOP:
	// Check and set the joint properties
	with(obj_deco)
	{
	 if (joint)
	 {
	  dks_joint_create();
	 }
	}
	//N3 LOOP:
	//Check and set any Joint Gear propeties. 
	// Perform any event previously setted from the editor
	with(obj_deco)
	{
	 if(joint)
	 {
	  if (phyprops[| physics.joint_type] = "Joint gear")
	  {
	   if(joint_target.joint) and (joint_list[| 1].joint)
	   {
	    joint_id = physics_joint_gear_create(joint_target, joint_list[| 1], joint_target.joint_id, joint_list[| 1].joint_id, joint_list[| 2]);
	   }
	   else
	   {
	    dks_message("Error! no joints found to link!") 
	   } 
	  }
	 } 
		
		// Playing any Tween 
	 if (have_tween)
	 {
	  TweenPlay(TweensTarget(id));
	 }
		
	 // Performing events
	 if(perform_event >-1)
	 {
	  event_user(perform_event);
	 }
	 
	 // Setting up Deco object activations  
	 if(!activated)
	 {
	  instance_deactivate_object(id);
	 }
	}
}