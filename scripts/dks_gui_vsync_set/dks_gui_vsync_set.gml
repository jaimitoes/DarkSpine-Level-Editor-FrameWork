function dks_gui_vsync_set() 
{
	if(vsync = false)
	{
	 display_reset(a_a,true);
	 vsync = true;
	 dks_message("Vsync_enabled");
	}
	else
	{
	 display_reset(a_a,false);
	 vsync = false;
	 dks_message("Vsync_disabled");
	}
}