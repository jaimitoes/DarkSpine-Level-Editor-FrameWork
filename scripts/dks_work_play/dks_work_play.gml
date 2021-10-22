function dks_work_play() 
{
	with(obj_deco)
	{
	 if (object_transform != noone)
	 {
	  if(!object_execute)
	  {
	   dks_object_swap(x,y,asset_get_index(object_transform));
	  }
	 } 
	}
 
	with (obj_deco)
	{
	 xstart = x;
	 ystart = y;
	 visible = is_visible;
	 if (is_physics)
	 {
	  dks_physics_create();
	  if (have_tween)
	  {
	   dks_tween_phy_update(id);
	  }
	  phy_fixed_rotation = phyprops[| physics.fixed_rotation];
	  phy_active = phyprops[| physics.active];
	 }
	} 
 
	with(obj_deco)
	{
	 if (joint)
	 {
	  dks_joint_create();
	 }
	}
 
	with(obj_deco)
	{
	 if(joint)
	 {
	  if (phyprops[| physics.joint_type] = "Joint gear")
	  {
	   if(joint_target.joint) and (joint_list[| 1].joint)
	   {
	    joint_id = physics_joint_gear_create(joint_target,joint_list[| 1],joint_target.joint_id,joint_list[| 1].joint_id,joint_list[| 2]);
	   }
	   else
	   {
	    dks_message("Error! no joints found to link!") 
	   } 
	  }
	 } 
   
		if (have_tween)
	 {
	  TweenPlay(TweensTarget(id));
	 }	
		
		
	 if(perform_event >-1)
	 {
	  event_user(perform_event);
	 }
 
	 
   
	 if(!activated)
	 {
	  instance_deactivate_object(id);
	 }
	}
}