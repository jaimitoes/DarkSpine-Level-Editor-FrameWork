function dks_setter_vector_set() 
{
	if (mouse_check_button_pressed(mb_left)) 
	{
	 with(target)
	 {
	  var creator = obj_deco_creator;
	  if (!have_polygon)
	  {
	   if (!ds_exists(poly_list, ds_type_list))
	   {
	    poly_list = ds_list_create();
	    if(creator.grid)
	    {
	      ds_list_add( poly_list, creator.mouse_grid_x -x, creator.mouse_grid_y -y);
     }
	    else
	    {
	     ds_list_add( poly_list, creator.Mxd -x, creator.Myd -y);
	    }
     
					with(creator)
	    {
	     if (grid)
	     {
	      node[0] = instance_create_depth( mouse_grid_x, mouse_grid_y, depth, obj_node);
	      node[0] = instance_create_depth( mouse_grid_x, mouse_grid_y, depth, obj_node);
	      bezier_n1[0] = instance_create_depth( mouse_grid_x, mouse_grid_y, depth, obj_node);
	      bezier_n2[0] = instance_create_depth( mouse_grid_x, mouse_grid_y, depth, obj_node);
      
	     }
	     else
	     {
	      node[0] = instance_create_depth( Mxd, Myd, depth, obj_node);
	      bezier_n1[0] = instance_create_depth( Mxd, Myd, depth, obj_node);
	      bezier_n2[0] = instance_create_depth( Mxd, Myd, depth, obj_node);
      
	     }
      
	     node[0].color = c_lime;
	     node[0].radius = 24;
	     node[0].radx = 24/64;
	     bezier_n1[0].visible = false;
	     bezier_n2[0].visible = false;
					}
	   }
	   else
	   {
     var size = array_length(creator.node);
	    var cord = dks_cord_object_to_screen(creator.node[0],creator.vcam, creator.pcam, creator.Dw, creator.Dh);
	    var cord2= dks_cord_object_to_screen(creator.node[size-1], creator.vcam, creator.pcam, creator.Dw, creator.Dh);
	    if point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),cord[0],cord[1],creator.node[0].radius)
	    {
	     if (size >2)
	     {
	      dks_vertex_nodes_destroy();
	      poly_closed = true;
	      var clock= polygon_is_clockwise(poly_list);
	      if(!clock)
	      {
	       ds_list_reverse(poly_list);
	      }
	      dks_polygon_set_offset(id);
	      have_polygon = 1;
	      global.show_collision = true;
	      creator.menu_setters = setter.vector_mod;exit;
	     }
	     else
	     {
	      dks_message(" Warning! You can´t create a CLOSED POLYGON with less than 3 points.");exit;
	     }
	    }
	    else if point_in_circle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),cord2[0],cord2[1],creator.node[size-1].radius)
	    {
	     if(size>1)
	     {
	      dks_vertex_nodes_destroy();
	      poly_closed = false;
	      dks_polygon_set_offset(id);
	      have_polygon = 1;
	      global.show_collision = true;
	      creator.menu_setters = setter.vector_mod;exit;
	     }
	    }
	    else
	    {
      if (creator.grid)
	     {
	      ds_list_add( poly_list,creator.mouse_grid_x-x, creator.mouse_grid_y-y);
      }
	     else
	     {
	      if keyboard_check(vk_control)
	      {
        var xf = abs(creator.node[size-1].x - creator.Mxd);
	       var yf = abs(creator.node[size-1].y - creator.Myd);
	       if(xf >yf)
	       {
	        ds_list_add( poly_list, creator.Mxd-x, creator.node[size-1].y-y);
	       }
	       else if (yf>xf)
	       {
	        ds_list_add( poly_list,creator.node[size-1].x-x, creator.Myd-y);
	       }
	      }
	      else
	      {
	       ds_list_add( poly_list, creator.Mxd-x, creator.Myd-y);
	      }
	     }
      var s = ds_list_size(poly_list);
	     creator.node[size] = instance_create_depth(poly_list[| s-2]+x,poly_list[| s-1]+y,depth,obj_node);
	     creator.node[size].color = c_aqua;
	     creator.node[size].radius = 24;
	     creator.node[size].radx = 24/64;
	     creator.bezier_n1[size] = instance_create_depth(poly_list[| s-2]+x,poly_list[| s-1]+y,depth,obj_node);
	     creator.bezier_n1[size].visible = false;
	     creator.bezier_n2[size] = instance_create_depth(poly_list[| s-2]+x,poly_list[| s-1]+y,depth,obj_node);
	     creator.bezier_n2[size].visible = false;
	     if(size>1)
	     {
	      creator.node[size-1].color = c_yellow;
	     }
	    }
	   }
	  }
	 }
	}
}