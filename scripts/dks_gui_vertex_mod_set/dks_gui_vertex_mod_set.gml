/// @description dks_gui_vertex_mod
function dks_gui_vertex_mod_set() 
{
	with(target)
	{
	 if (have_polygon)
	 {
	  obj_deco_creator.menu_setters = setter.vector_mod;exit;
	 }
	 else
	 {
	  dks_message("Warning! : No polygon created!");
	  dks_message("You must to be defined a polygon");
	 } 
	}
}