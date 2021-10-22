function dks_instance_destroy(argument0) 
{
 if is_array(argument0)
 {
  instance_destroy(asset_get_index(argument0[0]));
 } 
 else
 {
  if (argument0 != undefined)
  {
   instance_destroy(argument0);
  } 
  else
  {
   instance_destroy(id);	 
  }
 }
}