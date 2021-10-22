function dks_pad_android() 
{
 key_jump = 0;
	key_attack = 0;
	key_leftr = 0;
	key_left = 0;
	key_right = 0;
	key_dash = 0;
	key_rightr = 0;
	key_dash_released = 0;
	key_weapon = 0;
 for(var i=0; i<2; i++) 
	{
	 var dx = device_mouse_x_to_gui(i);
	 var dy = device_mouse_y_to_gui(i);
	 if device_mouse_check_button_pressed(i,mb_left)
	 {
   if point_in_rectangle(dx,dy,0,0,Dwh,Dh)// Half left checking
	  {
	   Mx_off = dx;
	   My_off = dy;
   }
   var press = dks_button_press_ext(b_virtual_jump,i);
	  if(press = 0)
	  {
	   key_jump = 1;
	  }
  
	  press = dks_button_press_ext(b_virtual_attack,i);
	  if(press = 0)
	  {
	   key_attack = 1;
	  }
	 }
	 //////////////////////////////////////////////////////////////////
	 if device_mouse_check_button(i,mb_left)
	 {
	  if point_in_rectangle(dx,dy,0,0,Dwh,Dh)
	  {
	   show_stick = 1;
	   Mx_dist = dx - Mx_off;
	   My_dist = dy - My_off;
  
	   if (Mx_dist >0)
	   {
	    key_left = false;
	    if(Mx_dist >= 16) and (Mx_dist <=128)
	    {
	     key_right = true;
	     key_dash = false;
	    }
	    else if(Mx_dist >128)
	    {
	     key_right = true;
	     key_dash = true;
	    }
	   }
	   else if (Mx_dist <0)
	   {
	    key_right = false;
	    if(Mx_dist <=-16) and (Mx_dist >-128)
	    {
	     key_left = true;
	     key_dash = false;
	    }
	    else if(Mx_dist <-128)
	    {
	     key_left = true;
	     key_dash = true;
	    }
	   }
	   else
	   {
	   key_left = 0;
	    key_right = 0;
	    key_dash = 0;
	   }
   
	   Mx = Mx_off + Mx_dist;
	   My = My_off + My_dist;
	  }
	  else
	  {
	   show_stick = 0;
	  }
	 }
 
	 if device_mouse_check_button_released(i,mb_left)
	 {
	  if point_in_rectangle(dx,dy,0,0,Dwh,Dh)
	  {
	   key_leftr = 1;
	   key_rightr = 1;
	   show_stick = 0;
	   if (Mx_dist > abs(128))
	   {
	    key_dash_released = 1;
	   }
	  }
  }
 }
}