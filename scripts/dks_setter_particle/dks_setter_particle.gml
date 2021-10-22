/// @description dks_setter_particle
function dks_setter_particle() 
{
	if(target != noone)
	{
	 var press, a;
	 if mouse_check_button_pressed(mb_left)
	 {
	  press = dks_button_press(button_create_particle);
	  if (press !=-1)
	  {
	   switch(press)
	   {
	    case 0: 
	    if !is_array(target.dk_part)
	    {
	     with(target)
	     {
	      dks_particle_data_init();
	     }
	    }
	    else
	    {
	     dks_message("Nothing to create");
	    }
	    break;
     case 1:
	    target.dk_part = 0;
			  if(target.object_index = obj_particle_system)
			  {
			   dks_particle_system_destroy(target.ps_system, target.ps_part)
			  }
			  if(input_created)
			  {
			   dks_input_list_destroy(input_list);
			   input_created = 0;
			  }
	    break;
    }
	   exit;
	  }
	 }

		if is_array(target.dk_part)
		{
		 if(!input_created)
		 {
		  a[0] = target.dk_part[0];
		  a[1] = target.dk_part[1];
		  a[2] = target.dk_part[2];
		  input_list = dks_input_list_create(button_part_sprite_int, a, 1);
		  input_list[| 0].draw_cursor = 0;
		  input_list[| 1].draw_cursor = 0;
		  input_list[| 2].draw_cursor = 0;
		  a = 0;
		  /////////////////////////////////////////////////
		  a[0] = target.dk_part[3];
		  a[1] = target.dk_part[4];
		  a[2] = target.dk_part[5];
		  a[3] = target.dk_part[6];
		  dks_input_list_add(button_part_size_int,a,input_list);
			  a = 0;
		  //////////////////////////////////////////////////
		  a[0] = target.dk_part[7];
		  a[1] = target.dk_part[8];
		  a[2] = target.dk_part[9];
		  prt_color1[0] = colour_get_hue(a[0]);
		  prt_color1[1] = colour_get_saturation(a[0]);
		  prt_color1[2] = colour_get_value(a[0]);
  
		  prt_color2[0] = colour_get_hue(a[1]);
		  prt_color2[1] = colour_get_saturation(a[1]);
		  prt_color2[2] = colour_get_value(a[1]);
  
		  prt_color3[0] = colour_get_hue(a[2]);
		  prt_color3[1] = colour_get_saturation(a[2]);
		  prt_color3[2] = colour_get_value(a[2]);
		  dks_button_add_colour(button_part_color3_int,0,dark_gray,target.dk_part[7],target.dk_part[7],dark_gray);
		  dks_button_add_colour(button_part_color3_int,1,dark_gray,target.dk_part[8],target.dk_part[8],dark_gray);
		  dks_button_add_colour(button_part_color3_int,2,dark_gray,target.dk_part[9],target.dk_part[9],dark_gray);
		  dks_input_list_add(button_part_color3_int,a,input_list);
		  a = 0;
		  //////////////////////////////////////////////
		  a[0] = target.dk_part[10];
		  a[1] = target.dk_part[11];
		  a[2] = target.dk_part[12];
		  dks_input_list_add(button_part_alpha3_int,a,input_list);
		  a = 0;
		  /////////////////////////////////////////////////
		  a[0] = target.dk_part[13];
		  a[1] = target.dk_part[14];
		  a[2] = target.dk_part[15];
		  a[3] = target.dk_part[16];
		  dks_input_list_add(button_part_speed_int,a,input_list);
		  a = 0;
		  /////////////////////////////////////////////////
		  a[0] = target.dk_part[17];
		  a[1] = target.dk_part[18];
		  a[2] = target.dk_part[19];
		  a[3] = target.dk_part[20];
		  dks_input_list_add(button_part_direction_int,a,input_list);
		  a = 0;
		  a[0] = target.dk_part[21];
		  a[1] = target.dk_part[22];
		  dks_input_list_add(button_part_gravity_int,a,input_list);
		  a = 0;
		  ////////////////////////////////////////////////
		  a[0] = target.dk_part[23];
		  a[1] = target.dk_part[24];
		  a[2] = target.dk_part[25];
		  a[3] = target.dk_part[26];
		  a[4] = target.dk_part[27];
		  dks_input_list_add(button_part_orientation_int,a,input_list);
		  a = 0;
		  ////////////////////////////////////////////////////////////
		  a[0] = target.dk_part[28];
		  dks_input_list_add(button_part_blend_int,a,input_list);
		  input_list[| 28].draw_cursor = 0;
		  a = 0;
		  ////////////////////////////////////////
		  a[0] = target.dk_part[29];
		  a[1] = target.dk_part[30];
		  dks_input_list_add(button_part_life_int,a,input_list);
		  a = 0;
		  //////////////////////////////////////////////////////////
		  a[0] = target.dk_part[31];
		  dks_input_list_add(button_part_numbs_int,a,input_list);
		  a = 0;
		  ///////////////////////////////////////////////////////////////
  
		  a[0] = target.dk_part[32];
		  dks_input_list_add(button_part_step_int,a,input_list);
		  input_list[| 32].draw_cursor = 0;
		  a = 0;
		  /////////////////////////////////////////////////////////
		  a[0] = target.dk_part[33];
		  dks_input_list_add(button_part_death_int,a,input_list);
		  a = 0;
		  ////////////////////////////////////////////////////////
		  a[0] = target.dk_part[34];
		  a[1] = target.dk_part[35];
		  a[2] = target.dk_part[36]
		  dks_input_list_add(button_part_emitter_int,a,input_list);
		  input_list[| 34].draw_cursor = 0;
		  input_list[| 35].draw_cursor = 0;
		  input_list[| 36].draw_cursor = 0;
		  a = 0;
		  ////////////////////////////////////////////////////////
		  a[0] = target.dk_part[37];
		  a[1] = target.dk_part[38];
		  a[2] = target.dk_part[39];
		  a[3] = target.dk_part[40];
		  dks_input_list_add(button_part_region_int,a,input_list);
		  a = 0;
		  ///////////////////////////////////////////////////////////
		  input_created = true;
  
	   switch(target.dk_part[32])
	   {
	    case 0: dks_input_set_text(input_list[| 32], "No");break;
	    case 1: dks_input_set_text(input_list[| 32], "Yes");break;
	   }
    
    
    
	   switch(target.dk_part[33])
	   {
	    case 0: dks_input_set_text(input_list[| 33], "No");break;
	    case 1: dks_input_set_text(input_list[| 33], "Yes");break;
	   }
    
    
    
	   switch(target.dk_part[34])
	   {
	    case 0: dks_input_set_text(input_list[| 34], "No");break;
	    case 1: dks_input_set_text(input_list[| 34], "Yes");break;
	   }
    
    
    
	   switch(target.dk_part[35])
	   {
	    case 0: dks_input_set_text(input_list[| 35], "Rectangle");break;
	    case 1: dks_input_set_text(input_list[| 35], "Elipse");break;
	    case 2: dks_input_set_text(input_list[| 35], "Diamond");break;
	    case 3: dks_input_set_text(input_list[| 35], "Line");break;
    }
      
	   switch(target.dk_part[36])
	   {
	    case 0: dks_input_set_text(input_list[| 36], "Gaussian");break;
	    case 1: dks_input_set_text(input_list[| 36], "InvGaussian");break;
	    case 2: dks_input_set_text(input_list[| 36], "Linear");break;
    }
	  }
		 else
		 {
    if mouse_check_button_pressed(mb_left)
	   {
	    var press = dks_button_press(button_part_sprite_int);
	    if (press >-1)
	    {
	     target.dk_part[@ press] = !target.dk_part[ press];
	     dks_input_set_text(input_list[| press], target.dk_part[press]);
     }
   
		   press = dks_button_press(button_part_blend_int);
		   if (press >-1)
		   {
		    target.dk_part[@ 28] = !target.dk_part[ 28];
		    dks_input_set_text(input_list[| 28], target.dk_part[28]);
    
		   }
		   press = dks_button_press(button_part_step_int);
		   if (press >-1)
		   {
		    target.dk_part[@ 32] = !target.dk_part[ 32];
		    if(target.dk_part[ 32])
		    {
		     dks_input_set_text(input_list[| 32],"Yes");
		    }
		    else
		    {
		     dks_input_set_text(input_list[| 32],"No");
		    }
		   }
		   ///////////////////////////////////////////////////
		   press = dks_button_press(button_part_death_int);
		   if (press >-1)
		   {
		    target.dk_part[@ 33] = !target.dk_part[ 33];
		    if(target.dk_part[ 33])
		    {
		     dks_input_set_text(input_list[| 33],"Yes");
		    }
		    else
		    {
		     dks_input_set_text(input_list[| 33],"No");
		    }
     }
		   press = dks_button_press(button_part_emitter_int);
	    if (press >-1)
	    {
	     switch(press)
	     {
		     case 0:
		     target.dk_part[@ 34] = !target.dk_part[ 34];
		     if(target.dk_part[ 34])
		     {
		      dks_input_set_text(input_list[| 34],"Yes");
		     }
		     else
		     {
		      dks_input_set_text(input_list[| 34],"No");
		     }
       break;
	      case 1:
		     switch(target.dk_part[ 35])
		     {
		      case 0: target.dk_part[@ 35] = 1; dks_input_set_text(input_list[| 35],"Elipse");break;
		      case 1: target.dk_part[@ 35] = 2; dks_input_set_text(input_list[| 35],"Diamond");break;
		      case 2: target.dk_part[@ 35] = 3; dks_input_set_text(input_list[| 35],"Line");break;
		      case 3: target.dk_part[@ 35] = 0; dks_input_set_text(input_list[| 35],"Rectangle");break;
	      }
       break;
		     case 2:
		     switch(target.dk_part[ 36])
		     {
		      case 0: target.dk_part[@ 36] = 1; dks_input_set_text(input_list[| 36],"Gaussian");break;
		      case 1: target.dk_part[@ 36] = 2; dks_input_set_text(input_list[| 36],"InvGaussian");break;
		      case 2: target.dk_part[@ 36] = 0; dks_input_set_text(input_list[| 36],"Linear");break;
		     }
	     }
     }
     ///////////////////////////////////////////////////////////
		   if keyboard_check(vk_control)
		   {
		    target.dk_part[@ 37] = Mxd - target.x;//local
		    target.dk_part[@ 39] = Myd - target.y;
		    dks_input_set_text(input_list[| 37], target.dk_part[37]);
		    dks_input_set_text(input_list[| 39], target.dk_part[39]);
	    }
     dks_particle_setter_update(target);
	   }
  
  
  
  
		  if mouse_check_button(mb_left)
		  {
	    press = dks_button_press(slider_particle_color1);
		   if (press >-1)
		   {
		    dks_slider_move(slider_particle_color1, press, prt_color1);
		    var col = make_colour_hsv(prt_color1[0], prt_color1[1],prt_color1[2]);
		    target.dk_part[@ 7] = col;
		    dks_button_add_colour(button_part_color3_int,0, dark_gray,col,col,dark_gray);
		    dks_input_set_text(input_list[| 7], col);
		    dks_input_set_color(input_list[| 7],col,dark_gray);
		    dks_particle_setter_update(target);
		   }
		   press = dks_button_press(slider_particle_color2);
		   if (press >-1)
		   {
		    dks_slider_move(slider_particle_color2, press, prt_color2);
		    var col = make_colour_hsv(prt_color2[0], prt_color2[1],prt_color2[2]);
		    target.dk_part[@ 8] = col;
		    dks_button_add_colour(button_part_color3_int,1, dark_gray,col,col,dark_gray);
		    dks_input_set_text(input_list[| 8], col);
		    dks_input_set_color(input_list[| 8],col,dark_gray);
		    dks_particle_setter_update(target);
		   }
   
		   press = dks_button_press(slider_particle_color3);
		   if (press >-1)
		   {
		    dks_slider_move(slider_particle_color3, press, prt_color3);
		    var col = make_colour_hsv(prt_color3[0], prt_color3[1],prt_color3[2]);
		    target.dk_part[@ 9] = col;
		    dks_button_add_colour(button_part_color3_int,2, dark_gray,col,col,dark_gray);
		    dks_input_set_text(input_list[| 9], col);
		    dks_input_set_color(input_list[| 9],col,dark_gray);
		    dks_particle_setter_update(target);
		   }
   
		   if keyboard_check(vk_control)
		   {
		    target.dk_part[@ 38] = Mxd - target.x;//local
		    target.dk_part[@ 40] = Myd - target.y;
		    dks_input_set_text(input_list[| 38], target.dk_part[38]);
		    dks_input_set_text(input_list[| 40], target.dk_part[40]);
		   }
		   //////////////////////////////////////////////////////////////////////////////
	   }
		  if keyboard_check_released(vk_anykey) 
		  {
		   var active = dks_input_list_get_active(input_list);
		   if (active)
		   {
		    target.dk_part = 0;
		    target.dk_part = dks_input_list_get_array_real(input_list);
		    var temp = dks_input_list_get_text(input_list);
      switch(temp[32])
		    {
		     case "Yes": target.dk_part[@32] = 1;break;
		     case  "No": target.dk_part[@32] = 0;break;
		    }
      switch(temp[33])
		    {
		     case "Yes": target.dk_part[@33] = 1;break;
		     case  "No": target.dk_part[@33] = 0;break;
		    }
      switch(temp[34])
		    {
		     case "Yes": target.dk_part[@34] = 1;break;
		     case  "No": target.dk_part[@34] = 0;break;
		    }
      switch(temp[ 35])
		    {
		     case "Rectangle": target.dk_part[@ 35] = 0; break;
		     case "Elipse": target.dk_part[@ 35] = 1;break;
		     case "Diamond": target.dk_part[@ 35] = 2;break;
		     case "Line": target.dk_part[@ 35] = 3; break;
      }
      switch(temp[ 36])
		    {
		     case "Gaussian": target.dk_part[@ 36] = 0; break;
		     case "InvGaussian": target.dk_part[@ 36] = 1;break;
		     case "Linear": target.dk_part[@ 36] = 2;break;
      }
      dks_particle_setter_update(target);
		    dks_button_add_colour(button_part_color3_int,0,dark_gray,target.dk_part[7],target.dk_part[7],dark_gray);
		    dks_button_add_colour(button_part_color3_int,1,dark_gray,target.dk_part[8],target.dk_part[8],dark_gray);
		    dks_button_add_colour(button_part_color3_int,2,dark_gray,target.dk_part[9],target.dk_part[9],dark_gray);
		    dks_input_set_color(input_list[| 7], target.dk_part[7],dark_gray);
		    dks_input_set_color(input_list[| 8], target.dk_part[8],dark_gray);
		    dks_input_set_color(input_list[| 9], target.dk_part[9],dark_gray);
		   }
    }
    if mouse_check_button_released(mb_left)
		  {
		   if keyboard_check(vk_control)
		   {
		    dks_particle_setter_update(target);
		   }
		  }
	  }
	 }
	}
}