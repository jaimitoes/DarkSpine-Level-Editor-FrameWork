/// @description dks_polygon_set_offset(id)
/// @param id
function dks_polygon_set_offset(argument0) 
{
	with(argument0)
	{
  var size = ds_list_size(poly_list) div 2;
	 var xf,yf,sx,sy;
	 dks_tensor_destroy();
	 for (var i =0;i<size;i++)
	 {
	  sx = i*2;
	  sy = i*2+1;
	  xf = scr_bind_set_xoffset(id,poly_list[| sx], poly_list[| sy]);
	  yf = scr_bind_set_yoffset(id,poly_list[| sx], poly_list[| sy]);
	  poly_list[| sx] =   xf;
	  poly_list[| sy] =   yf;
	  bezier_n1[ sx] = xf;
	  bezier_n1[sy] = yf;
	  bezier_n2[ sx] = xf;
	  bezier_n2[sy] = yf;
	 }
	 poly_off = dks_array_create_from_list(poly_list);
	 bz1_off = dks_array_copy(bezier_n1);
	 bz2_off = dks_array_copy(bezier_n2);
	}
}