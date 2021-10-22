function dks_object_edition(argument0) 
{
 with(argument0)
	{
	 if keyboard_check_pressed(vk_anykey)
	 {
	  switch (keyboard_key)
	  { 
	   case ord("D") : 
				if (obj_deco_creator.modo != mode.multiple)
				{
	    dks_image_switch_next();
				}	
	   break;
				
	   case ord("A") : 
				if (obj_deco_creator.modo != mode.multiple)
				{
	    dks_image_switch_prev();
				}
	   break;
	   case vk_right:
	   with(obj_deco_creator)
	   {
	    dks_undo_write(undo_map,other.id,0);
	   }
	   dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   x +=1;
	   if(parent)
	   {
	    dks_child_transform();
	   }
	   break;
	   case vk_left:
	   with(obj_deco_creator)
	   {
	    dks_undo_write(undo_map,other.id,0);
	   }
	   dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   x -=1;
	   if(parent)
	   {
	    dks_child_transform();
	   }
	   break;
	   case vk_up:
	   with(obj_deco_creator)
	   {
	    dks_undo_write(undo_map,other.id,0);
	   }
	   dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   if keyboard_check(vk_control)
	   {
	    depth +=1;
	   }
	   else
	   {
	    y -=1;
	   }
	   if(parent)
	   {
	    dks_child_transform();
	   }
	   break;
	   case vk_down:
	   with(obj_deco_creator)
	   {
	    dks_undo_write(undo_map,other.id,0);
	   }
	   dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   if keyboard_check(vk_control)
	   {
	    depth -=1;
	   }
	   else
	   {
	    y +=1;
	   }
   
	   if(parent)
	   {
	    dks_child_transform();
	   }
	   break;
	  }
	  //dks_tween_update(id,xstart,ystart);
	 } 
	 else
	 {
	  if mouse_check_button_pressed(mb_left)
	  {
	   with(obj_deco_creator)
	   {
	    dks_undo_write(undo_map,other.id,0);
	   }
   
	   dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   var dx = window_mouse_get_x();
	   var dy = window_mouse_get_y();
	   var cord = dks_cord_vertex_to_screen(x,y,depth,other.vcam,other.pcam,other.Dw,other.Dh);
   
	   if point_in_rectangle(dx, dy, cord[0]-64, cord[1]-8, cord[0]+64, cord[1]+8)
	   {
	    other.pos_edit = "x";
	   }
	   else if point_in_rectangle(dx, dy, cord[0]-8, cord[1]-64, cord[0]+8, cord[1]+64)
	   {
	    other.pos_edit = "y";
	   }
	   else
	   {
	    other.pos_edit = "xy";
	   }
	  } 
  
	  if mouse_check_button(mb_left)
	  {
	   switch (obj_deco_creator.scale_mode)
	   {
	    case "Rotation" : dks_editor_target_scale_an();break;
	    case "scale" :    dks_editor_target_scale();break;
	    case "pos" :      dks_editor_target_traslate();;break;
	   }   
     
				dks_particle_setter_update(id);
	   if (parent)
	   {
	    if (!keyboard_check(vk_shift))
	    {
	     dks_child_transform();
	    }
	   }
	  }
  
	  if mouse_check_button_released(mb_left)
	  {
	   dks_joint_update_pos(id);
	   if (!keyboard_check(vk_shift))///pressing shift you can move the parent without mod the childs..
	   {
	    dks_tween_set_offset(id);
	    dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	   }
     
				if(obj_deco_creator.depth != depth)
	   {
	    obj_deco_creator.depth = depth;
	    with(obj_cam_editor)
	    {
	     zz = creator.depth;
	     view_xoffset = camera_get_view_x(Cam)+wid;
	     view_yoffset = camera_get_view_y(Cam)+hei;
	     TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,0,0,40,"z",z, zz);
	    }
	   }
	  }
	 }
	}
}