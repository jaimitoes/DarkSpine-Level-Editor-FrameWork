function dks_gui_particle_set() 
{
	if(target != noone)
	{
	 menu_setters = setter.particles;
	}
	else
	{
	 dks_message("You must to select an object");
	}
}