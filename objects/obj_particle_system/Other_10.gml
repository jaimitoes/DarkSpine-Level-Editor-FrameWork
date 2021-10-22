/// THis event is performed if we set an event value from the editor, in the inspector setting we can see the "PERFOM EVENT" variable setted to -1 by default.
// In the moment we set the value to any number that match with a defined user event, this block is triggered, in this case, the User Event 0.
// If the Deco variable "variables" is converted to an array storing aditional data, the array "val" 
if is_array(variables)
{
 dks_array_update(val,variables);
 burst_script = asset_get_index(val[0]);
}
// Set the particle system depth
part_system_depth( ps_system, depth);
// If this object has the parent role and one of its children contains particle data stored in, located in the default variable of our Deco object called "dk_part"...
//...this script links all the particle data from the childs and store this in the current particle system, with this method, only 1 particle system is created...
//... and located in the Deco Father object.
dks_particle_link(ps_system,ps_part);