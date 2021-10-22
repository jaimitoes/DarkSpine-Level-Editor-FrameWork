function dks_tweener_manage_prop() 
{
 for(i=0;i<12;i++)
	{
	 var p_key_bar = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),bar[i][0],bar[i][1],bar[i][2],bar[i][3]);
	 var p_dist =  Mxd-x-xoffset;
	 var p_dist2 = device_mouse_x_to_gui(0)-32;
	 if (p_key_bar)
	 {
   switch (i)
	  {
    case 2: param[current_set][@2] = abs(par_xoffset[2]+p_dist*0.01);break;//RETRASO EN SEGUNDOS
	   case 3: param[current_set][@3] = abs(par_xoffset[3]+p_dist*0.01);break;//DURACION EN SEGUNDOS
	   case 4:
    switch(current_set)
	   {
     case 2 : param[current_set][@4] = par_xoffset[4]+p_dist*0.001;break;
	    case 3 : param[current_set][@4] = par_xoffset[4]+p_dist*0.001;break;
	    case 5 : param[current_set][@4] = par_xoffset[4]+p_dist*0.01;break;
	    case 6 : param[current_set][@4] = p_dist2*0.00390625;
                  
	             switch(p_dist2)
	             {
	              case 0  : 
	              param[current_set][@4] = c_black;
	              param[current_set][@6] = colour_get_hue(c_black);
	              param[current_set][@7] = colour_get_saturation(c_black);
	              param[current_set][@8] = colour_get_value(c_black);
                            
	              break;
	              case 256: 
                            
	              break;
	              default : 
	              var tc = make_color_hsv(p_dist2,255,255);
	              param[current_set][@4] = tc;
	              param[current_set][@6] = colour_get_hue(tc);
	              param[current_set][@7] = colour_get_saturation(tc);
	              param[current_set][@8] = colour_get_value(tc);
	              }
	    break;
                            
	    default : 
	    param[current_set][@4] = par_xoffset[4]+p_dist;    
	   break;
	   }
    break;
	   case 5:
    switch(current_set)
	   {
     case 2 : param[current_set][@5] = par_xoffset[5]+p_dist*0.001;break;
	    case 3 : param[current_set][@5] = par_xoffset[5]+p_dist*0.001;break;
	    case 5 : param[current_set][@5] = par_xoffset[5]+p_dist*0.01;break;
	    case 6 : param[current_set][@5] = p_dist2*0.00390625;///color
     switch(p_dist2)
	    {
	     case 0: 
      param[current_set][@5] = c_black;
	     param[current_set][@9] = colour_get_hue(c_black);
	     param[current_set][@10] = colour_get_saturation(c_black);
	     param[current_set][@11] = colour_get_value(c_black);
      break;
	     case 256: 
	     var tc = target.image_blend;
	     param[current_set][@5] = tc;
	     param[current_set][@9] = colour_get_hue(tc);
	     param[current_set][@10] = colour_get_saturation(tc);
	     param[current_set][@11] = colour_get_value(tc);
	     break;
	     default : 
	     var tc = make_color_hsv(p_dist2,255,255);
	     param[current_set][@5] = tc;
	     param[current_set][@9] = colour_get_hue(tc);
	     param[current_set][@10] = colour_get_saturation(tc);
	     param[current_set][@11] = colour_get_value(tc);
	     }break;
      default : param[current_set][@5] = par_xoffset[5]+p_dist;          
	     break;
	    }
    break;                   
	   default:
	   if(i>=6)
	   {
	    if(current_set = 6)
	    {
          
	     param[current_set][@i] = p_dist2;
	     var c1 = make_color_hsv(param[current_set][6],param[current_set][7],param[current_set][8]);
	     var c2 = make_color_hsv(param[current_set][9],param[current_set][10],param[current_set][11]);
	     param[current_set][@4] = c1;
	     param[current_set][@5] = c2;
	    } 
	   }       
   }
	 }
 } 
}