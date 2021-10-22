function dks_gui_vertex_delete_set() 
{
	with(target)
	{
	 if (have_polygon)
	 {
	  obj_deco_creator.menu_setters = setter.vector_del;exit;
	 }
	 else
	 {
	  dks_message("Warning! No polygon Created!");
	 } 
	}
}