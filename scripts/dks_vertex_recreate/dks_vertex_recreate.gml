/// @description dks_vertex_recreate(object)
/// @param object
function dks_vertex_recreate(argument0) 
{
 with(argument0)
	{
	 var nod = obj_deco_creator.node;
	 var bz1 = obj_deco_creator.bezier_n1;
	 var bz2 = obj_deco_creator.bezier_n2;
	 var size = array_length(nod);
	 var xf,yf,sx,sy;
	 ds_list_clear(poly_list);
	 dks_tensor_destroy();
	 poly_off = 0;
	 for (var i =0;i<size;i++)
	 {
	  sx = i*2;
	  sy = i*2+1;
	  xf = scr_bind_set_xoffset(id,nod[i].x -x, nod[i].y-y);
	  yf = scr_bind_set_yoffset(id,nod[i].x -x, nod[i].y-y);
	  poly_list[| sx] =   xf;
	  poly_list[| sy] =   yf;
	  poly_off[sx] = xf;
	  poly_off[sy] = yf;
	  xf = scr_bind_set_xoffset(id,bz1[i].x-x, bz1[i].y-y);
	  yf = scr_bind_set_yoffset(id,bz1[i].x-x, bz1[i].y-y);
	  bezier_n1[ sx] =  xf;
	  bezier_n1[ sy] =  yf;
	  bz1_off[sx] = xf;
	  bz1_off[sy] = yf;
	  xf = scr_bind_set_xoffset(id,bz2[i].x-x, bz2[i].y-y);
	  yf = scr_bind_set_yoffset(id,bz2[i].x-x, bz2[i].y-y);
	  bezier_n2[ sx] = xf;
	  bezier_n2[ sy] = yf;
	  bz2_off[sx] = xf;
	  bz2_off[sy] = yf;
	 }
	}
}