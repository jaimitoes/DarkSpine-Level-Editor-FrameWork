function dks_gui_terrain_set_collider() 
{
	if keyboard_check_released(vk_anykey)
	{
	 var active;
	 for(var i = 6; i<12; i++)
	 {
	  active = dks_input_get_active(input_list[| i]);
	  if(active)
	  {
	   switch(i)
	   {
	    case 6: target.col_xoff = dks_input_get_text_real(input_list[| 6]);break;
	    case 7: target.col_yoff = dks_input_get_text_real(input_list[| 7]);break;
	    case 8: target.corner1_xoff = dks_input_get_text_real(input_list[| 8]);break;
	    case 9: target.corner1_yoff = dks_input_get_text_real(input_list[| 9]);break;
	    case 10: target.corner2_xoff = dks_input_get_text_real(input_list[| 10]);break;
	    case 11: target.corner2_yoff = dks_input_get_text_real(input_list[| 11]);break;
    }
	  }
	 }
	}  
}