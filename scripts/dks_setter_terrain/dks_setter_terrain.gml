function dks_setter_terrain() 
{
	if (! input_created)
	{
	 var text;
	 text[ 0] = target.smooth_terrain;
	 text[ 1] = target.terrain_split;
	 text[ 2] = target.v_split;
	 text[ 3] = target.corner_left;
	 text[ 4] = target.corner_right;
	 text[ 5] = target.segment_split;
	 text[ 6] = target.col_xoff;
	 text[ 7] = target.col_yoff;
	 text[ 8] = target.corner1_xoff;
	 text[ 9] = target.corner1_yoff;
	 text[ 10] = target.corner2_xoff;
	 text[ 11] = target.corner2_yoff;
	 text[ 12] = 0;
 
	 input_list = dks_input_list_create(menu_b_terrain_int,text,1);
	 input_created = true;
	}
	else
	{
	 if mouse_check_button_pressed(mb_left)
	 {
	  var press = dks_button_press(menu_b_terrain_int);
	  if (press != -1)
	  {
	   dks_button_execute(menu_b_terrain_int,press);
	  }
	 } 
 
	 dks_gui_terrain_set_collider();
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