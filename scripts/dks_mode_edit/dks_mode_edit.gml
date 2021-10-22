function dks_mode_edit() 
{
	//hide the creator object
	image_alpha = 0;
	///The main buttons, check a group of buttons
	// and execute the assigned script if we are hover...
	if mouse_check_button_pressed(mb_left)
	{
		var press = dks_button_press(button_edit_mode);   
	 if (press > -1)
	 {
	  menu_setters = setter.closed;
	 } 
	}
	if mouse_check_button_released(mb_left)
	{
	 var press = dks_button_press(button_edit_mode);
	 if (press > -1)
	 {
	  dks_button_execute(button_edit_mode,press);exit;
	 }
	}    

	// A simple object that spawn randomly information of the editor.    
	if not instance_exists(obj_msn_info)
	{
	 instance_create_depth(x,y,0,obj_msn_info);
	}

	///Close the menu setters with the virtual button
	if  (menu_setters != setter.closed)
	{
	 if mouse_check_button_released(mb_left)
	 {
	  var cl = dks_button_press(menu_b_close)
	  if (cl>-1)
	  {
	   dks_set_offset(obj_deco, Mxd, Myd);
	   menu_setters = setter.closed;
	   exit;
	  }
	 }
	 var press = dks_button_press(button_edit_mode);   
	 if (press < 0)
	 {
	  script_execute(script_setters[menu_setters]);
	 } 
	}
	else//Edit the targeted object
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
	//Shortcut keys
	if keyboard_check_pressed(vk_anykey)
	{
	 if (!input_created)
	 {
	  switch (keyboard_key)
	  { 
	   case ord("W") : dks_sprite_swap(target,"sprite",0);
				if (target.have_texture)
				{
					dks_sprite_swap(target,"fill_texture",0);
				}
				if (target.have_path_texture)
				{
					dks_sprite_swap(target,"edge_texture",0);
				}
				break;
	   case ord("S") : dks_sprite_swap(target,"sprite",1);
				if (target.have_texture)
				{
					dks_sprite_swap(target,"fill_texture",1);
				}
				if (target.have_path_texture)
				{
					dks_sprite_swap(target,"edge_texture",1);
				}
				break;
	   case ord("P") : dks_editor_go_to_collision_mode();exit;
	   case ord("M") : dks_editor_go_to_tween_mode();exit;
	   case ord("R") : 
				dks_editor_scale_destroy(); 
	   dks_set_offset(target, Mxd, Myd);
				scale_mode = "Rotation";
				break;
	   case ord("E") : 
				scale_mode = "scale"; 
	   dks_set_offset(target, Mxd, Myd); 
				break;
	   case ord("T") : 
				dks_editor_scale_destroy(); 
	   dks_set_offset(target, Mxd, Myd); 
				scale_mode = "pos";
				break;
	   case vk_delete : dks_object_destroy(target);exit;
	   case ord("Z") : 
	   if !keyboard_check(vk_control)
	   {
	    dks_editor_image_reset(target);
	   }
	   else
	   {
	    dks_undo_read(undo_map,0);
					if(menu_setters = setter.color)
					{
					 blend_color[@0] = color_get_hue(target.image_blend);
			   blend_color[@1] = color_get_saturation(target.image_blend);
			   blend_color[@2] = color_get_value(target.image_blend);
					}
					exit;
	   }
	   break;
	   case ord("C") : 
	   if not keyboard_check(vk_control)
	   {
	    dks_gui_color_set();exit;
	   }
    break;
   }
	 }
	} 

	//Close setters or switch between modes
	if keyboard_check_pressed(vk_space)
	{
	 if(menu_setters != setter.closed)
	 {
	  if instance_exists(obj_input)
	  {
	   var active = dks_input_list_get_active(input_list);
	   if (active)
	   {
	    exit;
	   }
	  }
	  menu_setters = setter.closed;
	 }
	 else
	 {
	  dks_editor_go_to_create_mode();exit;
	 }
	}
	//IF no objects exists on room, go back to the create mode
	if not instance_exists (obj_deco)
	{
	 modo = mode.create;exit;
	}
	//Set the nearest target
	if (mouse_check_button_pressed(mb_right))
	{
	 dks_target_set(near);
	}
	// Go to the multiselection mode
	if keyboard_check_pressed(vk_alt)
	{
	 dks_destroy_tools();modo = mode.multiple;exit;
	}
	//Copy and Pasting a target
	if keyboard_check(vk_control)
	{
	 switch(menu_setters)
	 {
	  case setter.particles: break;
	  case setter.variables: break;
	  case setter.inspector: break;
	  default:
	  if keyboard_check_pressed(ord("C"))
	  {
	   last_copy = target;
	   dks_object_copy(target);
	   dks_message("Copied object...");
	  }
	  if keyboard_check_pressed(ord("V"))
	  {
	   if instance_exists(last_copy)
	   {
	    with(last_copy)
	    {
	     dks_object_paste( other.Mxd, other.Myd, object_index);
	    } 
	   }
	   else
	   {
					dks_editor_paste_last_copy()
	   } 
	  }
	 }
	}
}