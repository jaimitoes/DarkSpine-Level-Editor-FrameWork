/// @description  Check keyboard keys and settings
function dks_mode_create() 
{
	depth = lay_depth;
	//On buttons
	if mouse_check_button_released(mb_left)
	{
	 var press = dks_button_press(button_create_mode);
	 if (press > -1)
	 {
	  dks_button_execute(button_create_mode,press);exit;
	 }
	}

	//info depending the current setter
	if not instance_exists(obj_msn_info)
	{
	 instance_create_depth(0,0,0,obj_msn_info);
	}

	//Execute the current setter if you are not clicking a button
	if  (menu_setters != setter.closed)
	{
	 if mouse_check_button_pressed(mb_left) && !instance_exists(obj_question)
	 {
	  var cl = dks_button_press(menu_b_close); 
	  if (cl != -1)
	  {
	   menu_setters = setter.closed;exit;
	  }
	 }
	 var press = dks_button_press(button_create_mode);
	 if (press = -1)
	 {
	  script_execute(script_setters[menu_setters]);
	 } 
	}

	//Shorcut keys
	if !instance_exists(obj_input)
	{
	 if keyboard_check_pressed(vk_anykey)
	 {
	  switch (keyboard_key)
	  {
	   case ord("W") : dks_sprite_swap(id,"sprite",0);break;
	   case ord("S") : dks_sprite_swap(id,"sprite",1);break;
	   case ord("D") : dks_image_switch_next();break;
	   case ord("A") : dks_image_switch_prev();break;
	   case ord("Z") : dks_image_reset();break;  
	   case ord("R") : dks_editor_scale_destroy();scale_mode = "Rotation";break;
	   case ord("T") : dks_editor_scale_destroy();scale_mode = "pos";break;
	   case ord("E") : dks_editor_scale_create(id,image_xscale,image_yscale); scale_mode = "scale";break;
	   case ord("L") : dks_level_menu_create();break;
				case ord("V") : 
				if keyboard_check(vk_control)
				{
					dks_editor_paste_last_copy();
				}
				break;
	  } 
	 }
	}

	//Spacebar controller
	if keyboard_check_pressed(vk_space)
	{
	 if(menu_setters != setter.closed)
	 {
	  if instance_exists(obj_input)
	  {
	   var active = dks_input_get_active(obj_input);
	   if (active)
	   {
	    exit;
	   }
	  }
	  menu_setters = setter.closed;
	 }
	 else
	 {
	  dks_editor_go_to_edit_mode();exit;
	 }
	}
	//Adjust the scale of the Scale sliders
	if instance_exists(obj_scale)
	{
	 dks_editor_scale_set(id);
	} 

	//Switch between the scale, rotation or translation
	if mouse_check_button_pressed(mb_right)
	{
	 if   (menu_setters = setter.closed)
	 {
 
	  switch(scale_mode)
	  {
	   case "Rotation": dks_editor_scale_create(id,image_xscale,image_yscale) scale_mode = "scale";break;
	   case "scale"   : dks_editor_scale_destroy();scale_mode = "pos";break;
	   case "pos": dks_editor_scale_destroy();scale_mode = "Rotation";break;
	  }
	 }
	}

	//Creating an instance
	if mouse_check_button_pressed(mb_left)
	{
	 if (menu_setters = setter.closed) and (scale_mode = "pos")
	 {
	  var press = dks_button_press(button_create_mode);
	  if (press =-1)
	  {
	   dks_set_offset(id, Mxd, Myd);
	   if (!keyboard_check(vk_control))
	   {
	    if(cursor_sprite = -1)
	    {
	     image_alpha = 1;
	     dks_editor_get_target_data();
	     dks_object_paste(x,y,obj_deco);
	     image_alpha = 0.5;
	    }
	   }
	  }
	 } 
	}
 //Hide the object creator if we touch the buttons.
	if (menu_setters = setter.closed)
	{
	 var press = dks_button_press(button_create_mode);
	 if (press =-1)
	 {
	  image_alpha = 0.5;
	  if(scale_mode = "pos")
	  {
	   x = Mxd;
	   y = Myd;
	  } 
	  if mouse_check_button(mb_left)
	  {
	   switch (scale_mode)
	   {
	    case "Rotation" : dks_editor_scale_an();break;
	    case "scale" :    dks_editor_scale();break;
	   }
	  }
	 } 
	 else
	 {
	  image_alpha =0;
	 }  
	} 
	else
	{
	 image_alpha = 0;
	}                    
}