function dks_tweener_manage_key_plus() 
{
	for(i=0;i<6;i++)
	{      
	 var p_key_plus = point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), key_plus[i][0], key_plus[i][1], key_plus[i][2], key_plus[i][3]);
	 var p_key_minus= point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), key_minus[i][0], key_minus[i][1], key_minus[i][2], key_minus[i][3]);
  if (p_key_plus)
	 {
	  switch (i)
	  {
    case 0: 
				if (tweener[current_set] != array_length(ease)-1)
	   {
	    tweener[@current_set] += 1;
	    param[current_set][@0] = ease[tweener[current_set]];
	   }
	   else
	   {
	    tweener[@ current_set] = 0;
	    param[current_set][@0] = ease[tweener[current_set]];
	   }
				break;
	   case 1: 
				if not (rmode[current_set] = 4)
	   {
	    rmode[@ current_set]+=1;
	    param[current_set][@1] = rep_mode[current_set][rmode[current_set]];
    }
	   else
	   {
	    rmode[@ current_set]=0;
	    param[current_set][@1] = rep_mode[current_set][rmode[current_set]];
	   }
				break;
    case 2: param[current_set][@2] += 0.1;break;
	   case 3: param[current_set][@3] += 0.1;break;
	   case 4: 
	   switch(current_set)
	   {
	    case 6:
	    var tc = target.image_blend;
	    param[current_set][@4] = tc;
	    param[current_set][@6] = colour_get_hue(tc);
	    param[current_set][@7] = colour_get_saturation(tc);
	    param[current_set][@8] = colour_get_value(tc);
	    break;
	    default:
	    param[current_set][@4] += 0.1;
	   }
	   break;
	   case 5:
	   switch(current_set)
	   {
	    case 6:
	    var tc = target.image_blend;
	    param[current_set][@5] = tc;
	    param[current_set][@9] = colour_get_hue(tc);
	    param[current_set][@10] = colour_get_saturation(tc);
	    param[current_set][@11] = colour_get_value(tc);
	    break;
	    default:
	    param[current_set][@5] += 0.1;
	   }
	   break;
	  }
	 }
		if (p_key_minus)
		{
		 switch (i)
		 {
		  case 0: 
				if  (tweener[current_set] != 0)
		  {
		   tweener[@ current_set] -= 1;
		   param[current_set][@0] = ease[tweener[current_set]];
    }
		  else
		  {
		   tweener[@ current_set] =array_length(ease)-1;
		   param[current_set][@0] = ease[tweener[current_set]];
		  }
				break;
    case 1: 
				if not (rmode[current_set]= 0)
		  {
		   rmode[@ current_set] -= 1;
		   param[current_set][@1] = rep_mode[current_set][rmode[current_set]];
    }
		  else
		  {
		   rmode[@ current_set] = 4;
		   param[current_set][@1] = rep_mode[current_set][rmode[current_set]];
		  }
			 break;
		  case 2: param[current_set][@2] -= 0.1;break;
		  case 3: param[current_set][@3] -= 0.1;break;
		  case 4: 
		  switch(current_set)
		  {
		   case 6:
		   var tc = c_black;
		   param[current_set][@4] = tc;
		   param[current_set][@6] = colour_get_hue(tc);
		   param[current_set][@7] = colour_get_saturation(tc);
		   param[current_set][@8] = colour_get_value(tc);
		   break;
		   default:
		   param[current_set][@4] -= 0.1;
		  }
    break;
		  case 5: 
		  switch(current_set)
		  {
		   case 6:
		   var tc = c_black;
		   param[current_set][@5] = tc;
		   param[current_set][@9] = colour_get_hue(tc);
		   param[current_set][@10] = colour_get_saturation(tc);
		   param[current_set][@11] = colour_get_value(tc);
		   break;
		   default:
		   param[current_set][@5] += 0.1;
		  }
		  break;
   }
	 }
	}   
}