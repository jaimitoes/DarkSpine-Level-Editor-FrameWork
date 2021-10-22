/// @description dks_particle_set(System, particle, sprite, scaleX, scaleY, array_data)
/// @param System
/// @param  particle
/// @param  sprite
/// @param  scaleX
/// @param  scaleY
/// @param  array_data
function dks_particle_set(argument0, argument1, argument2, argument3, argument4, argument5) 
{
 if part_system_exists(argument0)
 {
		var pt = argument1,
		sp = argument2,
		sx = argument3,
		sy = argument4,
		a = argument5;
		part_type_sprite(pt, sp, a[0], a[1], a[2]);
		part_type_size(pt, a[3], a[4], a[5], a[6]);
		part_type_colour3(pt, a[7], a[8], a[9]);
		part_type_alpha3(pt, a[10], a[11], a[12]);
		part_type_speed(pt, a[13], a[14], a[15], a[16]);
		part_type_direction(pt, a[17], a[18], a[19], a[20]);
		part_type_gravity(pt, a[21], a[22]);
		part_type_orientation(pt , a[23], a[24], a[25], a[26], a[27]);
		part_type_blend(pt, a[28]);
		part_type_life(pt, a[29], a[30]);
		part_type_scale(pt, sx, sy);
 }
}