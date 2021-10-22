function dks_gui_joint_target_set() 
{
	if(joint_target_set)
	{
	 dks_button_add_text(menu_b_joint,1,"SET JOINT PROPS");
	 joint_target_set = 0;
	}
	else
	{
	 dks_button_add_text(menu_b_joint,1,"SET JOINT TARGET");
	 joint_target_set = 1;
	}
}