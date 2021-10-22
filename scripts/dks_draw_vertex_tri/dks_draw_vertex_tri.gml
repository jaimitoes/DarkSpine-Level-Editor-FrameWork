/// @description dks_draw_vertex_tri(poly_list, xoffset, yoffset, depth, color, closed, kind)
/// @param poly_list
/// @param  xoffset
/// @param  yoffset
/// @param  depth
/// @param  color
/// @param  closed
/// @param  kind
function dks_draw_vertex_tri(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	//Draw a custom wireframe representing the vertex data, this is an all in one wireframe script, that means...
	//...in not all cases the wireframe are shown representing all the correct vertex data coordinates.
	// For example, when you are managing a non closed polygon like a path texture, a series of point are not drawn...
	//... representing the orientation of our object or vertex transformations.
	var poly = argument0,
	cxf = argument1,
	cyf =  argument2,
	zst = (argument3-zoff)-1,
	color = argument4,
	closed = argument5,
	kind = argument6,
	crxf = corner1_xoff,
	cryf = corner1_yoff,
	crxf2 = corner2_xoff,
	cryf2 = corner2_yoff,
	vb = other.buffer_col,
	vf = other.format_col;
	vertex_begin(vb,vf);
	if is_array(poly)
	{
	 var s = array_length(poly);
 
	  scr_vertex_add_point_col(vb, poly[ 0]+cxf+crxf, poly[ 1]+cyf+cryf,zst,color,1);//first point have one more variable
	  for(var i =2;i<s-2;i+=2)
	  {
	   scr_vertex_add_point_col(vb, poly[ i]+cxf, poly[ i+1]+cyf,zst,color,1);
	  }
	  if(closed)
	  {
	   scr_vertex_add_point_col(vb, poly[ s-2]+cxf, poly[ s-1]+cyf,zst,color,1);
	   scr_vertex_add_point_col(vb,poly[ 0]+cxf ,poly[ 1]+cyf ,zst,color,1);
	  }
	  else
	  {
	   scr_vertex_add_point_col(vb, poly[ s-2]+cxf+crxf2, poly[ s-1]+cyf+cryf2,zst,color,1);//last point have one more variable
	  }
	}
	else
	{
	 if ds_exists(poly, ds_type_list)
	 {
	  var s = ds_list_size(poly);
	  scr_vertex_add_point_col(vb, poly[| 0]+cxf+crxf, poly[| 1]+cyf+cryf,zst,color,1);//first point have one more variable
	  for(var i =2;i<s-2;i+=2)
	  {
	   scr_vertex_add_point_col(vb,poly[| i]+cxf,poly[| i+1]+cyf,zst,color,1);
	  }
	  if(closed)
	  {
	   scr_vertex_add_point_col(vb, poly[| s-2]+cxf, poly[| s-1]+cyf,zst,color,1);
	   scr_vertex_add_point_col(vb, poly[| 0]+cxf,poly[| 1]+cyf,zst,color,1);
	  }
	  else
	  {
	   scr_vertex_add_point_col(vb, poly[| s-2]+cxf+crxf2, poly[| s-1]+cyf+cryf2,zst,color,1);//last point have one more variable
	  }
	 } 
	}
	vertex_end(vb);
	vertex_submit(vb,kind,-1);
}