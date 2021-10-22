/// @description dks_level_destroy
function dks_level_destroy() 
{
	if instance_exists(obj_deco_creator)
	{
	 with(obj_deco_creator)
	 {
	  dks_destroy_tools();
	  target = noone;
	  near = noone;
	 } 
	}
	instance_activate_object(obj_deco);
	instance_destroy(obj_deco);
}