function dks_editor_target_traslate() 
{
	if(obj_deco_creator.grid)
	{
  if!keyboard_check(vk_shift)
	 {
	  if keyboard_check(vk_control)
	  {
	   layer_offset = zoff -(global.mouse_yd-mouse_starty) - lay_depth;
	   depth = lay_depth + layer_offset;
	  }
	  else
	  {
	   with(obj_deco_creator)
	   {
	     dks_grid_check(0,0);
	     target.x = mouse_grid_x;
	     target.y = mouse_grid_y;
	   }
	  }
  }
	 else
	 {
	  switch(obj_deco_creator.pos_edit)
	  {
	   case "x" : x = global.mouse_xd - xoffset;break;
	   case "y" : y = global.mouse_yd - yoffset;break;
	   case "xy": 
	   x = global.mouse_xd -xoffset;
	   y = global.mouse_yd -yoffset;break;
	  }
	 }
 }
	else
	{
	 if keyboard_check(vk_control)
	 {
	  layer_offset = zoff -(global.mouse_yd-mouse_starty) - lay_depth;
	  depth = lay_depth + layer_offset;
	 }
	 else
	 {
   switch(obj_deco_creator.pos_edit)
	  {
	   case "x" : x = global.mouse_xd - xoffset;break;
	   case "y" : y = global.mouse_yd - yoffset;break;
	   case "xy": 
	   x = global.mouse_xd - xoffset;
	   y = global.mouse_yd - yoffset;break;
	  }
	 }
	}
}