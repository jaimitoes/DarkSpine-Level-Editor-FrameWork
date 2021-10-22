function dks_mode_animator() 
{
	image_alpha=0;
	var inp = dks_input_object_get_active(obj_input);
	if mouse_check_button_released(mb_left)
	{
	 var press = dks_button_press(button_animator_mode);
	 if (press >-1)
	 { 
	  dks_tweener_destroy();
	  dks_tween_stop(obj_deco);
	  dks_tweener_tween_reset(obj_deco);
	  dks_button_execute(button_animator_mode, press);exit;
	 }
	} 
	///////////////////////////////////////////////////////////
	if (mouse_check_button_pressed(mb_right))
	{
	 if (near != noone)
	 {
	  dks_destroy_tools();
	  target = near;
	  depth = target.depth;
	  step_undo =-1;
	  with(obj_cam_editor)
	  {
	   target_view = 1;
	  }
	  exit;
	 } 
	}
	/////////////////////////////////////////////////////////
	if keyboard_check_pressed(vk_anykey) && (!inp)
	{
	 switch (keyboard_key)
	 { 
	  case ord("R") : dks_editor_scale_destroy(); dks_set_offset(target, Mxd, Myd);scale_mode = "Rotation";break;
	  case ord("E") : scale_mode = "scale"; dks_set_offset(target, Mxd, Myd); break;
	  case ord("T") : dks_editor_scale_destroy(); dks_set_offset(target, Mxd, Myd); scale_mode = "pos";break;
	  case vk_space :
	  modo = mode.edit;	
	  dks_tweener_destroy();
	  exit;
	 }
	} 
	//////////////////////////////////////////////////////////////

	var press = dks_button_press(obj_motion_controller.button_argument_add);
	if (!inp) && (press <0) && (obj_motion_controller.can_play) && (!point_in_rectangle(Dx,Dy,0,0,370,720))
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
}