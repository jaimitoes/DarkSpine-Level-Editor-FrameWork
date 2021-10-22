/// @description dks_vertex_shape_create
function dks_vertex_shape_create() 
{
	// Create or update a vertex buffer that represents the shape of a set of polygon points.
 // This conditional tell us if our Deco object already contains a vertex shape buffer
	if (have_texture)
	{
	 //Delete any previous shape buffer
	 vertex_delete_buffer(v_buffer);
	 vertex_format_delete(v_format);
	}
	// Check if a list of triangle is created and destroy it.
	if ds_exists(tri, ds_type_list)
	{
	 ds_list_destroy(tri);
	}
	// This conditional tell us if our Deco object already contains a Path/Edges vertex buffer  
	if (have_path_texture)
	{
	 //Check if the vertex buffer is setted as smooth	
	 if(smooth_terrain)
	 {
	  // Ear clipping triangulation, triangulates our shape from the smooth polygon list	 
	  tri = dks_triangulate(poly_s);
	 }
	 else
	 {
	  // Ear clipping triangulation, triangulates our shape from the regular polygon list	 
	  tri = dks_triangulate(poly_list);
	 }
	}
	else
	{
	 // Ear clipping triangulation, triangulates our shape from the regular polygon list		
	 tri =  dks_triangulate(poly_list);
	}

	//Create the shape with the triangulation data, assigning on this script the Id of the 3D texture and...
	//...the number of the sprite image if the texture is packed as an animation.
	dks_vertex_shape(vertex_texture, fill_image);
	// Set this variable to true telling us a vertex shape exists
	have_texture = true;   
}