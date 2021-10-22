function dks_spine_node_manage(argument0) {
	var o = argument0;
	var gx = device_mouse_x_to_gui(0);
	var gy = device_mouse_y_to_gui(0);
	var s = ds_list_size(o.bone_list);
	if (!point_in_rectangle(gx,gy,0,0,128,720))
	{
	 for (var i =0;i<s;i++)
	 {
	  if mouse_check_button_pressed(mb_right)
	  {
	   var c = dks_cord_object_to_screen(ob_ffd[i],vcam,pcam,Dw,Dh);
	   var pos = point_in_circle(gx,gy,c[0],c[1],10);
	  if (pos)
	  {
	   if (!keyboard_check(vk_shift))
	   {
	    ob_ffd[i].target=true;
	    obj_ffd.child = false;
	   }
	   else
	   {
	    if (ob_ffd[i].target !=true)
	    {
	     ob_ffd[i].child = true;
	     for (var j =0;j<s;j++)
	     {
	      if(ob_ffd[j].target = true)
	      {
	       with(ob_ffd[i])
	       { 
	        var xf,yf;
	        xf = x-other.ob_ffd[j].x;
	        yf = y-other.ob_ffd[j].y;
	        bind_xoffset = scr_bind_set_xoffset(other.ob_ffd[j],xf,yf);
	        bind_yoffset = scr_bind_set_yoffset(other.ob_ffd[j],xf,yf);
	       }
	      }
	     }
	    }
	   }
	  }
	  else
	  {
	   if not keyboard_check(vk_control)  
	   {
	    if not keyboard_check(vk_shift)
	    {
	     ob_ffd[i].target = false;
	     ob_ffd[i].child  = false;
	    }
	   }
	  }
	 }
 
	 if (ob_ffd[i].target)
	 {
	  if instance_exists(obj_scale)
	  {
	   dks_editor_scale_set(ob_ffd[i]);
	  } 
	  ob_ffd[i].image_blend = c_blue;
	  target_ob = ob_ffd[i].id;
  
	  if mouse_check_button_pressed(mb_left)
	 {
  
	  dks_set_offset(id,Mxd, Myd);
	  dks_set_offset(ob_ffd[i],Mxd, Myd);
	 }  
 
	if mouse_check_button(mb_left)
	  {
	   if keyboard_check_pressed(vk_anykey)
	   { 
	    dks_set_offset(ob_ffd[i],Mxd, Myd);
	   }
   
	   switch (scale_mode)
	   {
	    case "Rotation" : dks_spine_node_angle(o,i);break;
	    case "scale" :    dks_spine_node_scale(o,i);break;
	    case "pos": dks_spine_node_pos(o,i);break;
	   }


    
    
	     for(var j =0;j<s;j++)
	     {
	      var o_child = ob_ffd[j];
	      if (o_child.child = true)
	      {
	       with (ob_ffd[i])
	       {
	        dks_matrix_update();
	       }
	       with(o_child)
	       {
	        dks_bind_to(ob_ffd[i],bind_xoffset,bind_yoffset);
	       }
	       var map2 = ds_map_create();
	       skeleton_bone_state_get(target.bone_list[| o_child.number], map2);
	       map2[? "x"] = o_child.x-x;
	       map2[? "y"] = -(o_child.y-y);
	       map2[? "angle"] = o_child.image_angle;
	       map2[? "xscale"] = o_child.image_xscale;
	       map2[? "yscale"] = o_child.image_yscale;
	       skeleton_bone_state_set(target.bone_list[| o_child.number], map2); 
	       ds_map_destroy(map2);
	      }
	     }
       
	   }
 
	 }
	 else
	 {
	  ob_ffd[i].image_blend = c_white;
	  if (ob_ffd[i].child)
	  {
	   ob_ffd[i].image_blend = c_yellow;
	  }
	  else
	  {
	   ob_ffd[i].image_blend = c_white;
	  }
	 }
 
 
  
  
     
	 } 

	}
  
   




}
