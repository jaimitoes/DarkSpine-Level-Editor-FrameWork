function dks_tweener_manage_key_active() 
{
	for (var i=0;i<10;i++)
	{
	 var p_key_set = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),key_set[i][0],key_set[i][1],key_set[i][2],key_set[i][3]);
	 if (p_key_set)
	 {
	  if (k_set[i]= 0)
	  {
	   if (param[i][3] >= 0.01)
	   {
	   k_set[@i]= 1;
	   }
	   else
	   {
	   dks_message("No puede dejar a 0 el tiempo de este slot");
	   }
   }
	  else
	  {
	  k_set[@i]= 0;
	  } 
  }
	}
}