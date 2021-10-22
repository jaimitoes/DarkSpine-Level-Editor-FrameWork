function dks_work_stop() 
{
	instance_destroy(obj_joint_test);
	with instance_create_depth(save_view_x,save_view_y,save_layer,obj_deco_creator)
	{
	 dks_workspace_set(other.id,other.save_folder,"temp");
	}
 dks_message("Work stopped...");
}