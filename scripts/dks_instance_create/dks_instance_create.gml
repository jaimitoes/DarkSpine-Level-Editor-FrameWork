/// @description dks_instance_create
///  @param x
///  @param y
///  @param depth
///  @param object
function dks_instance_create(argument0, argument1, argument2, argument3) 
{
 if is_array(argument0)
 {
  instance_create_depth(real(argument0[0]), real(argument0[1]), real(argument0[2]), asset_get_index(argument0[3]));		
 }
 else
 {
  instance_create_depth(argument0, argument1, argument2, argument3);	
 }
}