/// @description dks_vertex_destroy(id)
/// @param id
function dks_vertex_destroy(argument0)
{
	with(argument0)
	{
	 ds_list_destroy(poly_list);
	 poly_off = 0;
	 bz1_off  = 0;
	 bz2_off  = 0;
	 bezier_n1 =0;
	 bezier_n2 =0;
	 have_polygon = false;
	 dks_vertex_shape_destroy(id);
	 dks_vertex_terrain_destroy(id);
	}
}