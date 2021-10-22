/// @description scr_joint_target_set(object, target);
/// @param object
/// @param  target
function scr_joint_target_set(argument0, argument1) 
{
	with(argument0)
	{
	 joint_target = argument1;
	 joint = true;
	 with(joint_target)
	 {
	  if (!is_physics)
	  {
	   dks_phyprops_create();
	  }
	 }
	 if !ds_exists(joint_list, ds_type_list)
	 {
	  //ds_list_clear(joint_list);
	  //ds_list_clear(joint_offset);
	  joint_list = ds_list_create();
	  joint_offset = ds_list_create();
	  ds_list_add(joint_list,0,0,0,0,0,0,0,0,0,0,0);
	  ds_list_add(joint_offset,0,0,0,0,0,0,0,0);
	 }
 }
}