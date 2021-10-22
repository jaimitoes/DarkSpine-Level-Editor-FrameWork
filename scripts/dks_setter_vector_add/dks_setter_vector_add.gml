function dks_setter_vector_add() 
{
	var in = false;
	highlight_vertex = 0;
	if (target.have_polygon)
	{
	 //////////////////
	 if  instance_exists(obj_node)
	 {
	  if keyboard_check_released(vk_shift)
	  {
	   highlight_vertex = 0;
	   menu_setters = setter.vector_mod;
	   exit;
	  }
	  /////////////////
	  var clr;
	  switch(menu_setters)
	  {
	   case setter.vector_del: clr = red_pastel;break;
	   case setter.vector_add: clr = yellow_pastel;break;
	   case setter.vector_mod: clr = node_color;
	  } 
	  ///////////////////
	  var size = array_length(node);  
	  var node_x,node_y,bx,by,bx2,by2,x1,x2,y1,y2,dist,dir,lx,ly;
	  ///////////////////////
	  for (var i =0; i<size; i++)
	  {
	   node_x[i] = node[i].x;
	   node_y[i] = node[i].y;
	   bx[i] = bezier_n1[i].x;
	   by[i] = bezier_n1[i].y;
	   bx2[i] = bezier_n2[i].x;
	   by2[i] = bezier_n2[i].y;
	  }
	  //////////////////////
	  for ( i =0;i<size;i++)
	  {
	   if (i!=size-1)
	   {
	    x1 = node[i].x1;
	    y1 = node[i].y1;
	    x2 = node[i+1].x1;
	    y2 = node[i+1].y1;
	   }
	   else
	   {
	    x1 = node[size-1].x1;
	    y1 = node[size-1].y1;
	    x2 = node[0].x1;
	    y2 = node[0].y1;
	   }
   
	   dist = point_distance(x1,y1,x2,y2)/2;
	   dir = point_direction(x1,y1,x2,y2);
	   lx = x1 + lengthdir_x(dist,dir);
	   ly = y1 + lengthdir_y(dist,dir);
	   var t = point_in_circle( Dx, Dy,lx,ly,dist);
	   if(t)
	   {
	    highlight_vertex_draw[@ 0] = x1;
	    highlight_vertex_draw[@ 1] = y1;
	    highlight_vertex_draw[@ 2] = x2;
	    highlight_vertex_draw[@ 3] = y2;
	    highlight_vertex = 1;
	    if mouse_check_button_pressed(mb_left)
	    { 
	     in = true;
	     dks_undo_write(undo_map,target,0);
						//var vec = dks_cord_screen_to_vertex(Dx,Dy,vcam,pcam,Dw,Dh);
						//var xx = vec[3] + (camera_get_view_width(Cam)*vec[0]);
						//var yy = vec[4] - (camera_get_view_height(Cam)*vec[1])*2;
						var xx = global.mouse_xd;
						var yy = global.mouse_yd;
		 
	     if(i!=size-1)
	     {
	      node[ i+1].x = xx;
	      node[ i+1].y = yy;
	      bezier_n1[i+1].x = xx;
	      bezier_n1[i+1].y = yy;
	      bezier_n2[i+1].x = xx;
	      bezier_n2[i+1].y = yy;
		  
	      for (var j =i+2;j<size;j++)
	      {
	       node[j].x = node_x[j-1];
	       node[j].y = node_y[j-1];
	       bezier_n1[j].x = bx[j-1];
	       bezier_n1[j].y = by[j-1];
	       bezier_n2[j].x = bx2[j-1];
	       bezier_n2[j].y = by2[j-1];
	      }
          
	      node[size] = instance_create_depth(xx, yy, target.depth-1, obj_node);
	      node[size].color = clr;
	      node[size].radius = 24;
	      node[size].radx = 24/64;
	      node[size].x = node_x[size-1];
	      node[size].y = node_y[size-1];
          
	      bezier_n1[size] = instance_create_depth(xx, yy, target.depth -2,obj_node);
	      bezier_n1[size].x = bx[size-1];
	      bezier_n1[size].y = by[size-1];
	      bezier_n1[size].radius = 16;
	      bezier_n1[size].radx = 16/64;
	      bezier_n1[size].color = node_b1_color;
	      bezier_n1[size].visible = false;
	      bezier_n2[size] = instance_create_depth(xx, yy, target.depth -3,obj_node);
	      bezier_n2[size].x = bx2[size-1];
	      bezier_n2[size].y = by2[size-1];
	      bezier_n2[size].radius = 8;
	      bezier_n2[size].radx = 8/64;
	      bezier_n2[size].color = node_b2_color;
	      bezier_n2[size].visible = false;
	     }
	     else
	     {
	      node[size] = instance_create_depth(xx, yy,target.depth-1,obj_node);
	      node[size].color = node_color;
	      node[size].radius = 24;
	      node[size].radx = 24/64;
	      bezier_n1[size] = instance_create_depth(xx, yy,target.depth-2,obj_node);
	      bezier_n1[size].radius = 16;
	      bezier_n1[size].radx = 16/64;
	      bezier_n1[size].color = node_b1_color;
          
	      bezier_n1[size].visible = false;
	      bezier_n2[size] = instance_create_depth(xx, yy,target.depth-3,obj_node);
	      bezier_n2[size].radius = 8;
	      bezier_n2[size].radx = 8/64;
	      bezier_n2[size].color = node_b2_color;
	      bezier_n2[size].visible = false;
	     }
     }
	    break;
	   }
	  } 
	  node_x =0;
	  node_y =0;
	  bx =0;
	  by =0;
	  if (in = true)
	  {
	   dks_vertex_recreate(target);
     
	   dks_vertex_check(target);
	  }
  }
	 else
	 {
	  dks_vertex_nodes_create();
	 }
	}
}
