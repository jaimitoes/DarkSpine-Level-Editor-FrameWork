function dks_mode_multi_edit() 
{
	image_alpha=0;

	if not instance_exists(obj_msn_info)
	{
	 instance_create_depth(x,y,0,obj_msn_info);
	}

	if not instance_exists(obj_multiple_select)
	{
	 instance_create_depth( Mxd, Myd, depth, obj_multiple_select);
	}

	///////////////////////////////////////////////////////    
	if mouse_check_button_released(mb_left)
	{
	 var press = dks_button_press(button_multi_mode);
	 if (press > -1)
	 {
	  dks_button_execute(button_multi_mode,press);exit;
	 }
	}    
	///////////////////////////////////////////////////////

	if  (menu_setters != setter.closed)
	{
	 if mouse_check_button_released(mb_left)
	 {
	  var cl = dks_button_press(menu_b_close)
	  if (cl>-1)
	  {
	   menu_setters = setter.closed;exit;
	  }
	 }
	 var press = dks_button_press(button_multi_mode);   
	 if (press = -1)
	 {
	  script_execute(script_setters[menu_setters]);
	 } 
	}
	else
	{
	 if (target !=noone)
	 {
	  if instance_exists(obj_scale)
	  {
	   dks_editor_scale_set(target);
	  } 
	  else if (scale_mode = "scale")
	  { 
	   dks_editor_scale_create(target,target.image_xscale,target.image_yscale);
	  } 
	  var press = dks_button_press(button_edit_mode);
	  if(press < 0)
	  {
	   dks_object_edition(target);
	  }
	 }
	}
	///////////////////////////////////////////////////////////////////////

	if keyboard_check_pressed(vk_anykey)
	{
	 if (!input_created)
	 {
	  switch (keyboard_key)
	  { 
	   case ord("P") : dks_editor_go_to_collision_mode();exit;
	   case ord("M") : dks_editor_go_to_tween_mode();exit;
	   case ord("R") : dks_editor_scale_destroy(); dks_set_offset(target, Mxd, Myd);scale_mode = "Rotation";break;
	   case ord("E") : scale_mode = "scale"; dks_set_offset(target, Mxd, Myd); break;
	   case ord("T") : dks_editor_scale_destroy(); dks_set_offset(target, Mxd, Myd); scale_mode = "pos";break;
	   case vk_delete : dks_object_destroy(target);exit;
	   case ord("Z") : 
	   if !keyboard_check(vk_control)
	   {
	    dks_editor_image_reset(target);
	   }
	   else
	   {
	    dks_undo_read(undo_map,0);
	   }
	   break;
	   case ord("C") : 
	   if not keyboard_check(vk_control)
	   {
	    menu_setters = setter.color;
	   }
	   break;
	  }
	 }
	} 

	////////////////////////////////////////////////////
	if keyboard_check_pressed(vk_space)
	{
	 if(menu_setters != setter.closed)
	 {
	   if(menu_setters != setter.variables)
	   {
	   menu_setters = setter.closed;exit;
	   }
	 }
	 else
	 {
	  dks_editor_go_to_edit_mode();exit;
	 }
	}

	if not instance_exists (obj_deco)
	{
	 modo = mode.create;
	}

	if keyboard_check(vk_control)
	{
	 if keyboard_check_pressed(ord("V"))
	 {
	  dks_object_multi_copy_paste();
	 }  
	}
}