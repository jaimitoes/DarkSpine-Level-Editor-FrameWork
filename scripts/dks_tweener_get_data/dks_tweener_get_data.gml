function dks_tweener_get_data(argument0) 
{
	var object = argument0.id;
 if (object.have_tween)
	{
  for (var i =0; i<10; i++)
	 {
	  if TweenExists(object.tween[i])
	  {
	   k_set[i] = 1;	  
	   param[i][@0] = TweenGet(object.tween[i],"ease");
	   param[i][@1] = TweenGet(object.tween[i],"mode");
	   param[i][@2] = TweenGet(object.tween[i],"delay_start");
	   param[i][@3] = TweenGet(object.tween[i],"duration");
	   switch(i)
	   {
	    case 0:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.x;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.x;
	    break;
	    case 1:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.y;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.y;
	    break;
	    case 2:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.image_xscale;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.image_xscale;
	    break;
	    case 3:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.image_yscale;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.image_yscale;
	    break;
	    case 4:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.image_angle;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.image_angle;
	    break;
	    case 5:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.image_alpha;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.image_alpha;
	    break;
	    case 6:
	    var props = TweenGet(object.tween[i], "property");
	    var data = props[1];
	    param[i][@4] = data[0];
	    param[i][@5] = data[1];
	    param[i][@6] = colour_get_hue(data[0]);
	    param[i][@7] = colour_get_saturation(data[0]);
	    param[i][@8] = colour_get_value(data[0]);
	    param[i][@9] = colour_get_hue(data[1]);
	    param[i][@10] = colour_get_saturation(data[1]);
	    param[i][@11] = colour_get_value(data[1]);
   
	    break;
	    case 7:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.depth;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.depth;
	    break;
	    case 8:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.x_rotation;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.x_rotation;
	    break;
	    case 9:
	    param[i][@4]  = TweenGet(object.tween[i],"start")-object.y_rotation;
	    param[i][@5]  = TweenGet(object.tween[i],"destination")-object.y_rotation;
	    break;
    }
	  }
	  else
	  {
	   param[i][@2] = 0;
	   param[i][@3] = 0;
	   param[i][@4] = 0;
	   param[i][@5] = 0;
	  }
	 } 
  if is_array(object.tweenS)
	 {
			instance_destroy(obj_tween_node);
			tween_sequence = 0;
			dks_object_copy(object);  
			with(object)
			{
			 var s = array_length(tweenS);
			 for (var i =0; i<s; i++)
			 {
			  other.tween_sequence[i] = dks_object_paste(tweenS[i][0],tweenS[i][1],obj_tween_node);  
			  other.tween_sequence[i].start_color = c_lime;
			  other.tween_sequence[i].Dmethod = draw_method;
		   other.tween_sequence[i].draw_method = dks_draw_tween_node;
			  other.tween_sequence[i].image_xscale = tweenS[i][2];
			  other.tween_sequence[i].image_yscale = tweenS[i][3];
			  other.tween_sequence[i].image_angle = tweenS[i][4];
			  other.tween_sequence[i].image_alpha = tweenS[i][5];
			  other.tween_sequence[i].image_blend = tweenS[i][6];
			  other.tween_sequence[i].depth = tweenS[i][7];
			  other.tween_sequence[i].x_rotation = tweenS[i][8];
			  other.tween_sequence[i].y_rotation = tweenS[i][9];
			  ///Timeline data
			  other.tween_sequence[i].ease = tweenD[i][0];
			  other.tween_sequence[i].delay = tweenD[i][1];
			  other.tween_sequence[i].duration = tweenD[i][2];
			  other.tween_sequence[i].callstart = tweenD[i][3];
			  other.tween_sequence[i].callend = tweenD[i][4];
			  other.tween_sequence[i].callstop = tweenD[i][5];
			  if is_array(tweenCst)
			  {
			   other.tween_sequence[i].callstart_arg = dks_array2d_length_copy(tweenCst,i);
			  }
			  if is_array(tweenCed)
			  {
			   other.tween_sequence[i].callend_arg = dks_array2d_length_copy(tweenCed,i);
			  } 
			  if is_array(tweenCstop)
			  {
			   other.tween_sequence[i].callstop_arg = dks_array2d_length_copy(tweenCstop,i);
			  } 
	   }
		 } 
		 dks_set_offset(obj_tween_node,global.mouse_xd,global.mouse_yd);
	 }
	 dks_message("Animation data extracted");
	}
	else
	{
	 dks_message("This object doesn´t contain any animation data");
	}
}