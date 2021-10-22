/// @description dks_vertex_check(object id)
/// @param object id
function dks_vertex_check(argument0) 
{
	// Check if our Deco object contains any kind of vertex buffer data and update it from the editor
	// ATTENTION: This is not the same than transforming vertex buffers ingame, transforming is much faster...
	//...than recreate a vertex buffer, but this tool is needed for the editor and the recreation of nodes.
	with(argument0)
	{
	 //Check if our Deco object contains a Path/Edges vertex buffer	
	 if(have_path_texture)
	 {
	  dks_vertex_terrain_create();
	 }
	 //Check if our Deco object contains a Shape vertex buffer
	 if(have_texture)
	 {
	  dks_vertex_shape_create();
	 }
	 // Check if our Deco object is executed as a Light object and update his special event...
	 //...in this case, we are using the User event 0 to update the light properties
	 if(object_index = obj_vertex_light) or (object_index = obj_vertex_light_ext)
	 {
	  // Performing the User event	 
	  event_perform(ev_other,ev_user0);
	 }
	}
}