function dks_gui_vertex_texture_set() 
{
	if(target.have_polygon)
	{
	 if !ds_list_empty(sprite_tab)
	 {
	  if (target.poly_closed)
	  {
   
	   menu_setters = setter.sprite;
	  }
	  else
	  {
	   dks_message("Cannot create a texture fill with a non closed polygon");
	  }
	 }
	 else
	 {
	  dks_message(" The current level does not have a sprite folder structure, please add some sprites for the level.");
	 }
	}
	else
	{
	 dks_message("Warning! : A polygon must be defined.");
	}
}