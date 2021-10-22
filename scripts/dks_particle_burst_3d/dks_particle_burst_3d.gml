function dks_particle_burst_3d() 
{
	part_system_depth(ps_system,depth-1);
	part_system_depth(ps_system, depth-1);
	part_type_scale(ps_part[0],image_xscale,image_yscale);
	part_particles_create(ps_system,x,y,ps_part[0],dk_part[31]);
}