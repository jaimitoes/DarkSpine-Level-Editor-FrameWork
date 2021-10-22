function dks_editor_go_to_collision_mode() 
{
	if  (target !=noone)
	{
	 dks_destroy_tools();
	 modo = mode.polygon;exit;
	}
	else
	{
	 dks_message("You don´t have selected an object");
	}
}