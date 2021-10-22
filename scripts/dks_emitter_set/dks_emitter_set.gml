/// @description dks_emitter_set(System, emitter, particle, array_data);
/// @param System
/// @param  emitter
/// @param  particle
/// @param  array_data
function dks_emitter_set(argument0, argument1, argument2, argument3) 
{
	var system = argument0, emi = argument1, pt = argument2, a = argument3;
	part_emitter_clear(system,emi);
	if(a[34])
	{
	 part_emitter_region(system,emi,x + a[37], x +a[38],y + a[39],y + a[40],a[35],a[36]);
	 part_emitter_stream(system,emi,pt,a[31]);
	}
	else
	{
	 if !is_array(variables)
	 {
	  burst_script = dks_particle_burst;
	 }
	}
}