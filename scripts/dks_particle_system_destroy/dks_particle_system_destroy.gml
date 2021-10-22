/// @description dks_particle_system_destroy(system, particle array)
/// @param system
/// @param  particle array
///Destroys all particle types managed by this object.
function dks_particle_system_destroy(argument0, argument1)
{
	var system = argument0;
	var a = argument1;
	var s = array_length(a);
	for(var i =0; i<s; i++)
	{
	 part_type_destroy(a[i]);
	}
	//remove  array to free memory
	a= 0;
	dk_part= 0;
	// Destroys the particle system and emitters.
	part_system_destroy(system);
}