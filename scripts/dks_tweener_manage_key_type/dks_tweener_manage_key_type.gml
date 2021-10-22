function dks_tweener_manage_key_type() 
{
	for (var i=0;i<10;i++)
	{
	 var p_key_type = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),key_type[i][0],key_type[i][1],key_type[i][2],key_type[i][3]);
	 if (p_key_type)
	 {
	  current_set= i;
	  switch(current_set)
	  {
		  case 6:
		  dks_button_add_colour(bar, 6, orange_pastel, orange_pastel, dark_gray, dark_gray);
	   dks_button_add_colour(bar, 7, orange_pastel, orange_pastel, dark_gray, dark_gray);
	   dks_button_add_colour(bar, 8, orange_pastel, orange_pastel, dark_gray, dark_gray);
	   dks_button_add_colour(bar, 9, orange_pastel, orange_pastel, dark_gray, dark_gray);
	   dks_button_add_colour(bar, 10, orange_pastel, orange_pastel, dark_gray, dark_gray);
	   dks_button_add_colour(bar, 11, orange_pastel, orange_pastel, dark_gray, dark_gray);
				break;
				default:
		  dks_button_add_colour(bar, 6, dark_gray, dark_gray,orange_pastel, orange_pastel);
	   dks_button_add_colour(bar, 7, dark_gray, dark_gray,orange_pastel, orange_pastel);
	   dks_button_add_colour(bar, 8, dark_gray, dark_gray,orange_pastel, orange_pastel);
	   dks_button_add_colour(bar, 9, dark_gray, dark_gray,orange_pastel, orange_pastel);
	   dks_button_add_colour(bar, 10, dark_gray, dark_gray,orange_pastel, orange_pastel);
	   dks_button_add_colour(bar, 11, dark_gray, dark_gray,orange_pastel, orange_pastel);
	  }	
	  break;
	 }
 }
}