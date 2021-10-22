function dks_vertex_invert() 
{
	with(target)
	{
	 dks_vertex_scale(poly_list,0,0,image_angle,-image_xscale,-image_yscale,-1);
	 dks_vertex_check(id);
	} 
}