function dks_gui_vertex_add_set() 
{
	with(target)
	{
	 if (have_polygon)
	 {
  
	  obj_deco_creator.menu_setters = setter.vector_add;exit;
	 }
	 else
	 {
	  dks_message("Warning! No polygon created!");
	 } 
	}
}