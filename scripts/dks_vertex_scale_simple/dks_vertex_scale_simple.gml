/// @description dks_vertex_scale_simple( poly_list, centroid X, centroid Y, vertex_angle, vertex_xscale, vertex_yscale, z_scale)
/// @param  poly_list
/// @param  centroid X
/// @param  centroid Y
/// @param  vertex_angle
/// @param  vertex_xscale
/// @param  vertex_yscale
/// @param  z_scale
function dks_vertex_scale_simple(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	//alpha...
 var l = argument0;
	var mtp = matrix_build(argument1,argument2,0,x_rotation,y_rotation,argument3,argument4,argument5,argument6);
	var xf,yf,sx,sy,s;
	s = ds_list_size(poly_list) div 2;
	for (var i=0;i<s;i++)
	{
	 sx = i*2;
	 sy = i*2+1;
	 xf = poly_off[ sx];
	 yf = poly_off[ sy]; 
	 l[| sx] =  xf * mtp[0] + -yf *  mtp[1]*1;
	 l[| sy] = -xf * mtp[4] +  yf *  mtp[5]*1;
 }     
}