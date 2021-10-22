function dks_emitter_3d() 
{
	var x1,x2,y1,y2;
	x1 = x +dk_part[37];
	x2 = x +dk_part[38];
	y1 = y +dk_part[39];
	y2 = y +dk_part[40];
	part_system_depth(ps_system,depth);
	part_emitter_region(ps_system,ps_emitter,x1,x2,y1,y2,dk_part[35],dk_part[36]);
}