/// @description dks_vertex_shape_destroy(object)
/// @param object
function dks_vertex_shape_destroy(argument0) 
{
	with (argument0)
	{
	 //Destroy the shape buffer	
	 if(have_texture)
	 {
	  vertex_delete_buffer(v_buffer);
	  vertex_format_delete(v_format);
	  if ds_exists(tri, ds_type_list)
	  {
	   ds_list_destroy(tri);
	  }
	  have_texture = false;
	 }
	}
}