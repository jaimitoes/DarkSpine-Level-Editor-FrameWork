function dks_mode_polygon() 
{
	image_alpha=0;
	if not instance_exists(obj_msn_info)
	{
	 instance_create_depth(0,0,0,obj_msn_info);
	}
	if mouse_check_button_released(mb_left)
	{
	 var press = dks_button_press(button_physics_mode);
	 if (press >-1)
	 {
	  dks_button_execute(button_physics_mode, press);exit;
	 }
	}

	if keyboard_check_pressed( ord("Z"))
	{
	 dks_undo_read(undo_map,0);exit;
	} 

	if keyboard_check_pressed(vk_space)
	{
		if(menu_setters != setter.closed)
		{
			menu_setters = setter.closed;
		}
		else
		{
	  dks_editor_go_to_edit_mode();
			exit;
		}	
	}

	if (menu_setters != setter.closed)
	{
  if (grid)
	 {
	  dks_grid_check(0,0);
	 }
 
	 if mouse_check_button_pressed(mb_left)
	 {
	  var cl = dks_button_press(menu_b_close);
	  if (cl >-1)
	  {
	   if (target !=noone)
	   {
	    dks_set_offset(target, Mxd, Myd);
	   }
    menu_setters = setter.closed;
	   exit;
	  }
	 }
  script_execute(script_setters[menu_setters]);
 }
	else
	{
  if keyboard_check_pressed(vk_anykey)
	 {
	  switch(keyboard_key)
	  {
	   case ord("W") : 
	   if(target.have_texture)
	   {
	    dks_sprite_swap(target,"fill_texture",0);
	   }
	   if(target.have_path_texture)
	   {
	    dks_sprite_swap(target,"edge_texture",0);
	   }
   
	   dks_vertex_check(target);
	   break;
	   case ord("S") : 
	   if(target.have_texture)
	   {
	    dks_sprite_swap(target,"fill_texture",1);
	   }
	   if(target.have_path_texture)
	   {
	    dks_sprite_swap(target,"edge_texture",1);
	   }
	   dks_vertex_check(target);
	   break;
   
	   case ord("A") : 
	   with(target)
	   {
	    dks_image_switch_prev();
	    dks_vertex_check(id);
	   }
   
	   break;
	   case ord("D") : 
   
	   with(target)
	   {
	    dks_image_switch_next();
	    dks_vertex_check(id);
	   }
	   break;
   }
	 }
	 if (mouse_check_button_pressed(mb_right))
	 {
	  var press = dks_button_press(button_physics_mode);
	  if (press = -1)
	  {
	   if (near != target)
	   {
	    dks_target_set(near);
	   }
	  }
	 }
	}
}