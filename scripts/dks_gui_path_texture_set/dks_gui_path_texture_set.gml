function dks_gui_path_texture_set() 
{
	if (target.have_polygon)
	{
	 if !ds_list_empty(sprite_tab)
	 {
	  menu_setters = setter.sprite_path;
	 }
	 else
	 {
	  dks_message("No sprite structure created, please, add some sprites for the level")
	 }
	}
	else
	{
	 dks_message("Warning! : You must to define a polygon.");
	}
}