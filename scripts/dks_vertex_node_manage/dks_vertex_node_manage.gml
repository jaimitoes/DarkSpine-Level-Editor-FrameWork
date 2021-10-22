function dks_vertex_node_manage(argument0, argument1) 
{
	var node_list = array_length(argument0);
	var n = argument0;
	var click = mouse_check_button(mb_left);
	var clicked = mouse_check_button_pressed(mb_left);
	var released = mouse_check_button_released(mb_left);
	var dx = window_mouse_get_x();
	var dy = window_mouse_get_y();
	if(clicked)
	{
	 dks_undo_write(undo_map,target,0);
	}

	for (var i =0;i<node_list;i++)
	{
	 if (clicked)
	 {
	  dks_set_offset(n[i], Mxd, Myd);
	  if (n[i].color = argument1)
	  {
	   dks_set_offset(bezier_n1[i], Mxd, Myd);
	   dks_set_offset(bezier_n2[i], Mxd, Myd);
	  }
    
	  for(var j = 0; j<node_list; j++)
	  {
	   if (n[j].target = true)
	   {
	    if point_in_rectangle(dx, dy, n[j].x1-64*n[j].radx, n[j].y1-8*n[j].radx, n[j].x1+64*n[j].radx, n[j].y1+8*n[j].radx)
	    {
	     pos_edit = "x";break;
	    }
	    else if point_in_rectangle(dx, dy, n[j].x1-8*n[j].radx, n[j].y1-64*n[j].radx, n[j].x1+8*n[j].radx, n[j].y1+64*n[j].radx)
	    {
	     pos_edit = "y";break;
	    }
	    else
	    {
	     pos_edit = "xy";
	    }
	   } 
	  }
	 } 
	 if ( click)
	 {
	  if (n[i].target)
	  {
	   var check = 0;
	   for(var z = 0; z<instance_number(obj_node);z++)
	   {
	    if instance_find(obj_node,z).target
	    {
	     check +=1;
	    }
	   }
   
	   if(grid) and (check = 1)
	   {
	    n[ i].x = mouse_grid_x;
	    n[ i].y = mouse_grid_y;
	    if (n[i].color = argument1)
	    {
	     bezier_n1[i].x = mouse_grid_x;
	     bezier_n1[i].y = mouse_grid_y;
	     bezier_n2[i].x = mouse_grid_x;
	     bezier_n2[i].y = mouse_grid_y;
	    }
	   } 
	   else
	   {
	    switch(pos_edit)
	    {
	     case "x":  
		 n[ i].x = Mxd-n[i].xoffset;
	     if (n[i].color = argument1)
	     {
	      bezier_n1[i].x = Mxd - bezier_n1[i].xoffset;
	      bezier_n2[i].x = Mxd - bezier_n2[i].xoffset;
	     }
	     break;
	     case "y":  
	     n[ i].y = Myd-n[i].yoffset;
	     if (n[i].color = argument1)
	     {
	      bezier_n1[i].y = Myd - bezier_n1[i].yoffset;
	      bezier_n2[i].y = Myd - bezier_n2[i].yoffset;
	     }
	     break;
	     case "xy": 
	     n[ i].x = Mxd-n[i].xoffset;
	     n[ i].y = Myd-n[i].yoffset;
	     if (n[i].color = argument1)
	     {
	      bezier_n1[i].x = Mxd - bezier_n1[i].xoffset;
	      bezier_n1[i].y = Myd - bezier_n1[i].yoffset;
	      bezier_n2[i].x = Mxd - bezier_n2[i].xoffset;
	      bezier_n2[i].y = Myd - bezier_n2[i].yoffset;
	     }
	     break;
	    }
	   } 
	  }
	 }
	 if (released)
	 {
	  if(n[i].target = true)
	  {
	   if(n[i].color != argument1)
	   {
	    if point_in_circle(n[i].x,n[i].y,node[i].x,node[i].y,node[i].radius/2)
	    {
	     n[i].x = node[i].x;
	     n[i].y = node[i].y;
	    }
	   }
	  }
	 }
	}
}