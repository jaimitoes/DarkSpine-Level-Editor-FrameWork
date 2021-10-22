/// @description dks_vertex_offset_set(id)
/// @param id
function dks_vertex_offset_set() 
{
	poly_off =0;
	bz1_off =0;
	bz2_off =0;
	var sx,sy,s;
	s = ds_list_size(poly_list) div 2;
	for (var i=0;i<s;i++)
	 {
	  sx = i*2;
	  sy = i*2+1;
	 bz1_off[sx] = bezier_n1[ sx];
	 bz1_off[sy] = bezier_n1[ sy];
	 bz2_off[sx] = bezier_n2[ sx];
	 bz2_off[sy] = bezier_n2[ sy];
	 poly_off[sx] = poly_list[| sx];
	 poly_off[sy] = poly_list[| sy];
	}
}