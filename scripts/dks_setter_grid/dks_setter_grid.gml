function dks_setter_grid() 
{
	if (!input_created)
	{
	 input_list = dks_input_list_create(slider_grid_int, slider_val,1);
	 input_created = true;
	}
	else
	{
	 if mouse_check_button_pressed(mb_left)
	 {
	  var press = dks_button_press(menu_b_switch);
	  if (press !=-1)
	  {
	   switch(press)
	   {
	    case 0 : grid = 0;break;
	    case 1 : grid = 1;break;
	   }
	  }
	 }
  
		if (grid)
	 {
	  var press = dks_button_press(slider_grid);
	  if (press >-1 and mouse_check_button(mb_left))
	  {
	   var d = abs(slider_grid[press][0] - device_mouse_x_to_gui(0));
	   slider_val[@ press] = d;
	   dks_input_list_set_text(input_list, slider_val);
	   var col = make_color_hsv(slider_val[0], slider_val[1], slider_val[2]);
	   grid_color = col;
				
			}
	  if keyboard_check_released(vk_anykey)
	  {
	   var active = dks_input_list_get_active(input_list);
	   if(active)
	   {
	    slider_val =0;
	    slider_val = dks_input_list_get_array_real(input_list);
	   }
    
				if(slider_val[3] <8) or (slider_val[4] <8)
	   {
	    grid_width = 8;
	    grid_height = 8;
    }
	   else
	   {
	    grid_width = slider_val[3];
	    grid_height= slider_val[4];
	   }
	  
			 with(obj_grid)
	   {
	    event_perform(ev_create,0);
	   }
	  } 
   dks_button_add_colour(slider_grid,0,dark_gray,slider_val[0],slider_val[0],dark_gray);
	  dks_button_add_colour(slider_grid,1,dark_gray,slider_val[1],slider_val[1],dark_gray);
	  dks_button_add_colour(slider_grid,2,dark_gray,slider_val[2],slider_val[2],dark_gray);
	  dks_button_add_colour(slider_grid_int,3,dark_gray,dark_gray,grid_color,dark_gray);
	  dks_button_add_colour(slider_grid_int,4,dark_gray,grid_color,grid_color,dark_gray);
	 }
	}
}