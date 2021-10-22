/// @description dks_vertex_terrain_destroy(id);
/// @param id
function dks_vertex_terrain_destroy(argument0) 
{
	with(argument0)
	if(have_path_texture)
	{
	 vertex_delete_buffer(buffer_path);
	 vertex_format_delete(format_path);
	 have_path_texture = false;
	 if ds_exists(ed, ds_type_list)
	 {
	  ds_list_destroy(ed);
	 }
	 if ds_exists(poly_s, ds_type_list)
	 {
	  ds_list_destroy(poly_s);
	 }
	}
}