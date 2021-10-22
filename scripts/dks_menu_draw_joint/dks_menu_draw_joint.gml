function dks_menu_draw_joint() 
{
	if(target.joint)
	{
	 dks_button_add_text(menu_b_joint,0,target.phyprops[| physics.joint_type]);
	 dks_draw_button_reel(menu_b_joint);
	 switch(target.phyprops[| physics.joint_type])
	 {
	  case "Joint distance":
	  dks_draw_button_reel(menu_b_joint_distance_info);
	  dks_button_add_text_list(menu_b_joint_distance_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_distance_int);
 
	  break;
	  case "Joint rope":
	  dks_draw_button_reel(menu_b_joint_rope_info);
	  dks_button_add_text_list(menu_b_joint_rope_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_rope_int);
 
	  break;
	  case "Joint revolute":
	  dks_draw_button_reel(menu_b_joint_revolute_info);
	  dks_button_add_text_list(menu_b_joint_revolute_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_revolute_int);
 
	  break;
	  case "Joint prismatic":
	  dks_draw_button_reel(menu_b_joint_prism_info);
	  dks_button_add_text_list(menu_b_joint_prism_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_prism_int);

	  break;
	  case "Joint pulley":
	  dks_button_add_text_list(menu_b_joint_pulley_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_pulley_int);
	  dks_draw_button_reel(menu_b_joint_pulley_info);

	  break;
	  case "Joint friction":
	  dks_button_add_text_list(menu_b_joint_friction_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_friction_int);
	  dks_draw_button_reel(menu_b_joint_friction_info);
	  break;
	  case "Joint gear":
	  dks_button_add_text_list(menu_b_joint_gear_int,target.joint_list);
	  dks_draw_button_reel(menu_b_joint_gear_int);
	  dks_draw_button_reel(menu_b_joint_gear_info);
	  break;
	  case "Joint weld":
	  dks_button_add_text_list(menu_b_joint_weld_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_weld_int);
	  dks_draw_button_reel(menu_b_joint_weld_info);
	  break;
	  case "Joint wheel":
	  dks_button_add_text_list(menu_b_joint_wheel_int,target.joint_list);
	  dks_draw_button_rectangle(menu_b_joint_wheel_int);
	  dks_draw_button_reel(menu_b_joint_wheel_info);
	  break; 
	 }
	}
}