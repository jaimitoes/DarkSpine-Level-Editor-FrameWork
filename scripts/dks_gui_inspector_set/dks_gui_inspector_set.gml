function dks_gui_inspector_set() 
{
	if (target !=noone)
	{
	 menu_setters = setter.inspector;
	}
	else
	{
	 dks_message("You must to select an object!");
	}
}