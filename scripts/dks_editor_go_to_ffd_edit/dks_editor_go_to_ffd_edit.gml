function dks_editor_go_to_ffd_edit() 
{
	if(menu_setters = setter.closed)
	{ 
	 if (target != noone)
	 {
	  if  (target.is_spine)
	  {
	   dks_editor_scale_destroy();
	   dks_destroy_tools();
	   scale_mode = "pos";
	   modo = mode.ffd_edit;exit;
	  }
	  else
	  {
	   dks_message("It´s not a Spine sprite.");exit;
	  }
	 }   
	 else
	 {
	  dks_message("You_must to select an object with right click!")exit;
	 } 
	}
}