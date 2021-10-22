function dks_setter_vector_mod() 
{
	var press = dks_button_press(button_physics_mode);
	if(press = -1) && (target != noone)
	{
	 if (target.have_polygon)
	 {
	  if  instance_exists(obj_node)
	  {
	   dks_node_select(obj_node);
	   dks_vertex_node_manage(node,node_color);
	   var s = array_length(node);
	   if keyboard_check_pressed(vk_alt)
	   {
	    show_bezier = !show_bezier;
	   }
   
	   if(bezier_n1[0].visible != show_bezier)
				{
	    for(var i =0;i<s;i++)
	    {
	     bezier_n1[i].visible = show_bezier;
	     bezier_n2[i].visible = show_bezier;
	    }
				}	
	
    if(!target.poly_closed)
		  {
		   bezier_n2[0].visible = false;
		   bezier_n1[s-1].visible = false;
				}
		
    if(show_bezier)
		  {
		   //dks_node_select(bezier_n1);
		   //dks_node_select(bezier_n2);
		   dks_vertex_node_manage(bezier_n1,node_color);
		   dks_vertex_node_manage(bezier_n2,node_color);
		  }
  
            
		  if mouse_check_button(mb_left)
		  { 
		   dks_vertex_recreate(target);
		   dks_vertex_check(target);
		  }    
  
		  if mouse_check_button_released(mb_left)
		  {
		   dks_vertex_recreate(target);
		   dks_vertex_check(target);
		  }
				
		  if keyboard_check(vk_shift)
		  {
		   menu_setters = setter.vector_add;exit;
		  }
				
		  if keyboard_check(vk_delete)
		  {
		   dks_vertex_node_delete(node);
		  }
   }
		 else
		 {
		  dks_vertex_nodes_create();
		 }
	 }
		
		if (mouse_check_button_pressed(mb_right))
		{
		 var press = dks_button_press(button_physics_mode);
		 if (press = -1)
		 {
		  if (near != target) and (near !=noone)
		  {
		   dks_target_set(near);
		  }
		 }
		}
	}          
}