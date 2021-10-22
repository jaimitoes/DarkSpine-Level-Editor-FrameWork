function dks_setter_vector_del() 
{
	var dx = window_mouse_get_x();
	var dy = window_mouse_get_y();  
	if (target.have_polygon)
	{
	 if  instance_exists(obj_node)
	 {
	  if mouse_check_button_pressed(mb_left)
	  {
	   var size = array_length(node);  
	   for ( i =0;i<size;i++)
	   {
	    var cord = dks_cord_object_to_screen(node[i],vcam,pcam,Dw,Dh);
	    var pos = point_in_circle(dx,dy,cord[0],cord[1],node[i].radius);
	    if (pos)
	    {
	     dks_undo_write(undo_map,target, 0);
	     dks_vertex_node_delete(node[i]);break;
	    }
	   }
	  }
	 }
	 else
	 {
	  dks_vertex_nodes_create();
	 }
	}
}