function dks_setter_interface() 
{
	if (!input_created)
	{
	 input_list = dks_input_list_create(button_setter_interface_int, interface,1);
	 input_created = true;
	}
	else
	{
	 if keyboard_check_released(vk_anykey)
	 {
	  var active = dks_input_list_get_active(input_list);
	  if(active)
	  {
	   interface = 0;
	   interface = dks_input_list_get_array_real(input_list);
	   obj_cam_editor.zoom_trans = interface[Interface.z_speed];
	   obj_cam_editor.fov = interface[Interface.foview];
	   icon_scale = interface[Interface.icon];
	  }
	 }
	} 
}