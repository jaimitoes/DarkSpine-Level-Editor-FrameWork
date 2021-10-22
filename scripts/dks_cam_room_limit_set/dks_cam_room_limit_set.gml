/// @descrition dks_cam_room_limit_set
/// @param camObject
/// @param boolean
function dks_cam_room_limit_set(argument0, argument1) 
{
	if is_array(argument0)
	{
	 var o = asset_get_index(argument0[0]);	
	 if instance_exists(o)
	 {
	  o.room_limit = argument0[1];
	 } 
	}
	else
	{
	 if instance_exists(argument0)
	 {
	  argument0.room_limit = argument1;	
	 } 
	}
}