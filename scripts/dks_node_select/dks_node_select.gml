/// @description dks_node_select(node object);
/// @param node object
function dks_node_select(argument0) 
{
	if mouse_check_button_pressed(mb_right)
	{
	 gui_rectangle =0;
	 dks_set_offset(id, Mxd, Myd);
	 Dxoff = Dx;
	 Dyoff = Dy;
	 var wx = Dx;
	 var wy = Dy;
	 var s = instance_number(argument0);
	 var inst;
	 if(show_bezier)
	 {
	  // N1 Loop
	  for (var i =0; i<s;i++)
	  {
	   inst = instance_find(argument0,i);
	   if (inst.visible) && (inst.color = node_b2_color)
	   {
    
	    if point_in_circle( wx , wy, inst.x1, inst.y1, inst.radius)
	    {
	     if not keyboard_check(vk_control)
	     {
	      with(obj_node)
	      {
	       target = false;
	      }
	     }
	     inst.target= true;
	     target_ob = inst;
	     exit;
	    }
	   }
	  }
	  //N2 Loop
	  for (var i =0; i<s;i++)
	  {
	   inst = instance_find(argument0,i);
	   if (inst.visible) && (inst.color = node_b1_color)
	   {
	    if point_in_circle( wx , wy, inst.x1, inst.y1, inst.radius)
	    {
	     if not keyboard_check(vk_control)
	     {
	      with(obj_node)
	      {
	       target = false;
	      }
	     }
	     inst.target= true;
	     target_ob = inst;
	     exit;
	    }
	   }
	  }
	 } 
	 //N3 Loop
	 for (var i =0; i<s;i++)
	 {
	  inst = instance_find(argument0,i);
	  if (inst.color = node_color)
	  {
	   if point_in_circle( wx , wy, inst.x1, inst.y1, inst.radius)
	   {
	    if not keyboard_check(vk_control)
	    {
	     with(obj_node)
	     {
	      target = false;
	     }
	    }
	    inst.target= true;
	    target_ob = inst;
	    exit;
	   }
	  }
	 }
	 gui_rectangle = 1;
	 with(obj_node)
	 {
	  target = false;
	 }
	 target_ob = false;
	}  

	if mouse_check_button_released(mb_right)
	{
	 if(gui_rectangle) 
	 {
	  with(obj_node)
	  { 
	   if dks_in_rectangle(x1, y1,other.Dxoff,other.Dyoff, other.Dx, other.Dy)
	   {
	    target = true;
	   }
	   else
	   {
	    if(other.target_ob != id)
	    {
	     if not keyboard_check(vk_control)
	     {
	      target = false;
	     }
	    }
	   }
	  }
	 }
	 gui_rectangle = 0;
	}
}