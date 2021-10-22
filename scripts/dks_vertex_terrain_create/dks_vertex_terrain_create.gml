/// @description dks_vertex_terrain_create
function dks_vertex_terrain_create() 
{
	// Creates a Path/Edges vertex buffer based on a list of points structure

	//Check if our Deco object already contains a Path/Edges vertex buffer
	if(have_path_texture)
	{
	 //Delete any previous buffer	
	 vertex_delete_buffer(buffer_path);
	 vertex_format_delete(format_path);
	}
   
	//Check if our polygon list are setted as closed
	if(poly_closed)
	{ 
	 // If a smooth polygon exists	
	 if(smooth_terrain)
	 {
	  //Creates the vertex buffer using the polygon list and the texture ID stored into the variable "path_texture"...
	  //...THis script also gets the data of the texture ID assigned in the variable "path_texture"
	  dks_vertex_terrain_smooth(path_texture, path_image,image_blend,image_alpha,terrain_split,segment_split);
	 }
	 else
	 {
	  //Creates the vertex buffer using the polygon list and the texture ID stored into the variable "path_texture"...
	  //...THis script also gets the data of the texture ID assigned in the variable "path_texture"	 
	  dks_vertex_terrain(path_texture, path_image,image_blend,image_alpha,terrain_split);
	 }
	} //If our polygon is not closed
	else
	{
	//Create a path texture that can be store 2 Edges
	 dks_vertex_path(path_texture, path_image,image_blend,image_alpha,terrain_split, v_split, segment_split,corner_left,corner_right);
	}
	have_path_texture = true;
}