/// @description dks_draw_vertex_debug(object)
/// @param object
function dks_draw_vertex_debug(argument0) 
{
	// Deactivating the Z-Buffer to prevent artifacts drawing the vertex data
	//gpu_set_ztestenable(0);
	gpu_set_zwriteenable(0);
	//Drawing the vertex data [Limited in layers, best performance, prevent a non-sense of hundreds of lines]
	with(argument0)
	{
	 // Check if our object is located on the same layer selected from our editor.
	 if (lay_depth = obj_deco_creator.lay_depth)
	 { 
	  //Create a local matrix world from this object
	  dks_matrix_update();
	  // Set the new matrix world
	  matrix_set(matrix_world,mtx);
	  // Check if our deco object contains vertex data 
	  if (have_polygon)
	  {
	   // Drawing a smooth terrain with the an universal wireframeDraw script "dks_draw_vertex_tri"... 
	   //...take a look at the description of this script.
	   if(smooth_terrain)
	   {
		// Drawing the vertices of a smooth terrain.
	    dks_draw_vertex_tri(poly_s, col_xoff, col_yoff, depth, c_lime, poly_closed, pr_linestrip);
	   }
	   else
	   {
		// Drawing the vertices of a regular terrain. 
	    dks_draw_vertex_tri(poly_list, col_xoff, col_yoff, depth, c_lime, poly_closed, pr_linestrip);
	   }
	   // Check if our Deco object contains a path/edge texture data.
	   if (have_path_texture)
	   {
	    // Drawing the bezier line using the same script.
	    dks_draw_vertex_tri(ed, 0, 0, depth, c_orange, poly_closed, pr_linestrip);
	   }
	  }
	  else
	  {
	   // If a deco object does not cotains any buffer and the moment you assign physical attributes...
	   //...a default shape is created while you assing this properties from the editor.
	   dks_draw_shape(id, other.buffer_col, other.format_col);
	  }
	  // Reset the matrix world
	  matrix_set(matrix_world,global.mat_world);
	 }
	}
 //Activate the Z buffer if the 3D settings are activated
 if(global.start_3d)
	{
	 //gpu_set_ztestenable(1);
	 gpu_set_zwriteenable(1);
	} 
}