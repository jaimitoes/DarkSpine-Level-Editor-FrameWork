function dks_gui_tween_show_arguments() 
{
	if instance_exists(obj_motion_controller)
	{
	 with(obj_motion_controller)
	 {
	  show_arguments = !show_arguments;
	  if(show_arguments)
	  {
	  dks_button_add_text(other.button_animator_mode, 1, "Hide arguments");	 
	  }
	  else
	  {
	   dks_button_add_text(other.button_animator_mode, 1, "Show arguments");	 
	  }
  
	  if ds_exists(callstart_input, ds_type_list)
	  {
	   var s = ds_list_size(callstart_input);
	   for (var i = 0; i<s; i++)
	   {
	    callstart_input[| i].visible = show_arguments;    
	   }
	  }
	  if ds_exists(callend_input, ds_type_list)
	  {
	   var s = ds_list_size(callend_input);
	   for (var i = 0; i<s; i++)
	   {
	    callend_input[| i].visible = show_arguments;    
	   }
	  }
	 }
	}
}