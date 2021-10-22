/// @description dks_input_set_size(id, width, height)
/// @param id
/// @param  width
/// @param  height
function dks_input_set_size(argument0, argument1, argument2) 
{
	argument0.width = argument1;
	argument0.height = argument2;
	//update surface
	surface_free(argument0.surf);
	argument0.surf = surface_create(argument0.width-(argument0.xoffset*2), argument0.height-(argument0.yoffset*2));
}