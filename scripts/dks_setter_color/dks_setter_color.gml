function dks_setter_color() 
{
	if (mouse_check_button_pressed(mb_left)) && (target != noone)
	{
		dks_undo_write(undo_map,target.id, 0);
	}
	if (mouse_check_button(mb_left))
	{
	 if (target != noone)
	 {
	  var press = dks_button_press(slider_color);
	  if (press>-1)
	  {
	   dks_slider_move(slider_color, press, blend_color);
	  }
	  var col = make_color_hsv(blend_color[0], blend_color[1], blend_color[2]);
	  target.image_blend = col;
	  with(target)
	  { 
	   dks_vertex_check(id);
	   if (parent)
	   {
	    scr_color_child();
    
	   }
	  }  
	 }
	}
}