function dks_joint_init() 
{
	// physics lists
	joint_distance = ds_list_create();
	joint_distance[| e_joint_distance.w_anchor1_x] = 0;
	joint_distance[| e_joint_distance.w_anchor1_y] = 0;
	joint_distance[| e_joint_distance.w_anchor2_x] = 0;
	joint_distance[| e_joint_distance.w_anchor2_y] = 0;
	joint_distance[| e_joint_distance.collidable]  = 1;

	joint_rope = ds_list_create();
	joint_rope[| e_joint_rope.w_anchor1_x] = 0;
	joint_rope[| e_joint_rope.w_anchor1_y] = 0;
	joint_rope[| e_joint_rope.w_anchor2_x] = 0;
	joint_rope[| e_joint_rope.w_anchor2_y] = 0;
	joint_rope[| e_joint_rope.max_length]  = 0;
	joint_rope[| e_joint_rope.collidable]  = 1;

	joint_revolute = ds_list_create();
	joint_revolute[| e_joint_revolute.w_anchor_x] = 0;
	joint_revolute[| e_joint_revolute.w_anchor_y] = 0;
	joint_revolute[| e_joint_revolute.ang_min_limit] = 0;
	joint_revolute[| e_joint_revolute.ang_max_limit] = 0;
	joint_revolute[| e_joint_revolute.ang_limit]  = 0;
	joint_revolute[| e_joint_revolute.max_motor_torque]  = 0;
	joint_revolute[| e_joint_revolute.motor_speed] = 0;
	joint_revolute[| e_joint_revolute.motor] = 0;
	joint_revolute[| e_joint_revolute.collidable] = 1;

	joint_prism = ds_list_create();
	joint_prism[| e_joint_prism.w_anchor_x] = 0;
	joint_prism[| e_joint_prism.w_anchor_y] = 0;
	joint_prism[| e_joint_prism.w_axis_x] = 0;
	joint_prism[| e_joint_prism.w_axis_y] = 0;
	joint_prism[| e_joint_prism.lower_trans_limit]  = 0;
	joint_prism[| e_joint_prism.upper_trans_limit]  = 0;
	joint_prism[| e_joint_prism.limit_enable] = 0;
	joint_prism[| e_joint_prism.motor_enable] = 0;
	joint_prism[| e_joint_prism.motor_speed] = 0;
	joint_prism[| e_joint_prism.max_motor_speed] = 0;
	joint_prism[| e_joint_prism.collidable] = 1;

	joint_pulley = ds_list_create();
	joint_pulley[| e_joint_pulley.w_anchor1_x] = 0;
	joint_pulley[| e_joint_pulley.w_anchor1_y] = 0;
	joint_pulley[| e_joint_pulley.w_anchor2_x] = 0;
	joint_pulley[| e_joint_pulley.w_anchor2_y] = 0;
	joint_pulley[| e_joint_pulley.l_anchor1_x] = 0;
	joint_pulley[| e_joint_pulley.l_anchor1_y] = 0;
	joint_pulley[| e_joint_pulley.l_anchor2_x] = 0;
	joint_pulley[| e_joint_pulley.l_anchor2_y] = 0;
	joint_pulley[| e_joint_pulley.ratio] = 1;
	joint_pulley[| e_joint_pulley.collidable] = 1;

	joint_friction = ds_list_create();
	joint_friction[| e_joint_friction.anchor_x] = 0;
	joint_friction[| e_joint_friction.anchor_y] = 0;
	joint_friction[| e_joint_friction.max_force] = 0;
	joint_friction[| e_joint_friction.max_torque] = 0;
	joint_friction[| e_joint_friction.collidable] = 1;

	joint_gear = ds_list_create();
	joint_gear[| e_joint_gear.joint_1] = 0;
	joint_gear[| e_joint_gear.joint_2] = 0;
	joint_gear[| e_joint_gear.ratio] = 1;

	joint_weld = ds_list_create();
	joint_weld[| e_joint_weld.anchor_x] = 0;
	joint_weld[| e_joint_weld.anchor_y] = 0;
	joint_weld[| e_joint_weld.ref_angle] = 0;
	joint_weld[| e_joint_weld.freq_hz] = 0;
	joint_weld[| e_joint_weld.damping_ratio] = 0;
	joint_weld[| e_joint_weld.collidable] = 1;

	joint_wheel = ds_list_create();
	joint_wheel[| e_joint_wheel.anchor_x] = 0;
	joint_wheel[| e_joint_wheel.anchor_y] = 0;
	joint_wheel[| e_joint_wheel.axis_x] = 0;
	joint_wheel[| e_joint_wheel.axis_y] = 0;
	joint_wheel[| e_joint_wheel.motor_enable] = 0;
	joint_wheel[| e_joint_wheel.max_motor_torque] = 0;
	joint_wheel[| e_joint_wheel.motor_speed] = 0;
	joint_wheel[| e_joint_wheel.freq_hz] = 0;
	joint_wheel[| e_joint_wheel.damping_ratio] = 1;
	joint_wheel[| e_joint_wheel.collidable] = 1;

	// set the text of Joints for gui elements
	text_joint_type[0] = "disabled";
	text_joint_type[1] = "Joint distance";
	text_joint_type[2] = "Joint rope";
	text_joint_type[3] = "Joint revolute";
	text_joint_type[4] = "Joint prismatic";
	text_joint_type[5] = "Joint pulley";
	text_joint_type[6] = "Joint friction";
	text_joint_type[7] = "Joint gear";
	text_joint_type[8] = "Joint weld";
	text_joint_type[9] = "Joint wheel";

	menu_b_joint = dks_button_create(128,0,256,24,128,14,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_256);
	menu_b_joint = dks_button_add_reel(menu_b_joint,"down",256,64,128,14,0,dark_gray, orange_pastel, orange_pastel,dark_gray,spr_button_256);
	dks_button_add_text_script( menu_b_joint,1, "SET TARGET", dks_gui_joint_target_set);
	menu_b_joint_distance_info = dks_button_reel_create("down",5,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_distance_int = dks_button_reel_create("down",5,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_distance_info,0,"W_anchor1_x");
	dks_button_add_text(menu_b_joint_distance_info,1,"W_anchor1_y");
	dks_button_add_text(menu_b_joint_distance_info,2,"W_anchor2_x");
	dks_button_add_text(menu_b_joint_distance_info,3,"W_anchor2_y");
	dks_button_add_text(menu_b_joint_distance_info,4,"Collidable");

 menu_b_joint_rope_info = dks_button_reel_create("down",6,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_rope_int = dks_button_reel_create("down",6,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_rope_info,0,"W_anchor1_x" );
	dks_button_add_text(menu_b_joint_rope_info,1,"W_anchor1_y" );
	dks_button_add_text(menu_b_joint_rope_info,2,"W_anchor2_x" );
	dks_button_add_text(menu_b_joint_rope_info,3,"W_anchor2_y" );
	dks_button_add_text(menu_b_joint_rope_info,4,"Max length");
	dks_button_add_text(menu_b_joint_rope_info,5,"Collidable");

 menu_b_joint_revolute_info = dks_button_reel_create("down",9,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_revolute_int = dks_button_reel_create("down",9,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_revolute_info,0, "W_anchor1_x");
	dks_button_add_text(menu_b_joint_revolute_info,1, "W_anchor1_y");
	dks_button_add_text(menu_b_joint_revolute_info,2, "Min angle limit");
	dks_button_add_text(menu_b_joint_revolute_info,3, "Max angle limit");
	dks_button_add_text(menu_b_joint_revolute_info,4, "Angle limit enable");
	dks_button_add_text(menu_b_joint_revolute_info,5, "Max motor torque");
	dks_button_add_text(menu_b_joint_revolute_info,6, "Motor speed");
	dks_button_add_text(menu_b_joint_revolute_info,7, "Motor enable");
	dks_button_add_text(menu_b_joint_revolute_info,8, "Collidable");

 menu_b_joint_prism_info = dks_button_reel_create("down",11,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_prism_int = dks_button_reel_create("down",11,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_prism_info,0, "W_anchor_x");
	dks_button_add_text(menu_b_joint_prism_info,1, "W_anchor_y");
	dks_button_add_text(menu_b_joint_prism_info,2, "W_axis_x");
	dks_button_add_text(menu_b_joint_prism_info,3, "W_axis_y");
	dks_button_add_text(menu_b_joint_prism_info,4, "Lower trans limit");
	dks_button_add_text(menu_b_joint_prism_info,5, "Upper trans limit");
	dks_button_add_text(menu_b_joint_prism_info,6, "Limit enable");
	dks_button_add_text(menu_b_joint_prism_info,7, "Motor enable");
	dks_button_add_text(menu_b_joint_prism_info,8, "Motor speed");
	dks_button_add_text(menu_b_joint_prism_info,9, "Max motor speed");
	dks_button_add_text(menu_b_joint_prism_info,10, "Collidable");

 menu_b_joint_pulley_info = dks_button_reel_create("down",10,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_pulley_int =  dks_button_reel_create("down",10,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_pulley_info,0, "W_anchor1_x");
	dks_button_add_text(menu_b_joint_pulley_info,1, "W_anchor1_y");
	dks_button_add_text(menu_b_joint_pulley_info,2, "W_anchor2_x");
	dks_button_add_text(menu_b_joint_pulley_info,3, "W_anchor2_y");
	dks_button_add_text(menu_b_joint_pulley_info,4, "L_anchor1_x");
	dks_button_add_text(menu_b_joint_pulley_info,5, "L_anchor1_y");
	dks_button_add_text(menu_b_joint_pulley_info,6, "L_anchor2_x");
	dks_button_add_text(menu_b_joint_pulley_info,7, "L_anchor2_y");
	dks_button_add_text(menu_b_joint_pulley_info,8, "Ratio");
	dks_button_add_text(menu_b_joint_pulley_info,9, "Collidable");

 menu_b_joint_friction_info = dks_button_reel_create("down",5,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_friction_int = dks_button_reel_create("down",5,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_friction_info,0, "Anchor x");
	dks_button_add_text(menu_b_joint_friction_info,1, "Anchor y");
	dks_button_add_text(menu_b_joint_friction_info,2, "Max force");
	dks_button_add_text(menu_b_joint_friction_info,3, "Max torque");
	dks_button_add_text(menu_b_joint_friction_info,4, "Collidable");

 menu_b_joint_gear_info = dks_button_reel_create("down",3,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_gear_int = dks_button_reel_create("down",3,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_gear_info,0, "Joint 1" );
	dks_button_add_text(menu_b_joint_gear_info,1, "Joint 2");
	dks_button_add_text(menu_b_joint_gear_info,2, "Ratio");

 menu_b_joint_weld_info = dks_button_reel_create("down",6,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_weld_int = dks_button_reel_create("down",6,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_weld_info,0, "Anchor_x");
	dks_button_add_text(menu_b_joint_weld_info,1, "Anchor_y");
	dks_button_add_text(menu_b_joint_weld_info,2, "Ref_angle");
	dks_button_add_text(menu_b_joint_weld_info,3, "Frequency in hz");
	dks_button_add_text(menu_b_joint_weld_info,4, "Damping ratio");
	dks_button_add_text(menu_b_joint_weld_info,5, "Collidable");

 menu_b_joint_wheel_info = dks_button_reel_create("down",10,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_joint_wheel_int = dks_button_reel_create("down",10,256,96,128,32,4,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_joint_wheel_info,0, "Anchor_x");
	dks_button_add_text(menu_b_joint_wheel_info,1, "Anchor_y");
	dks_button_add_text(menu_b_joint_wheel_info,2, "Axis x");
	dks_button_add_text(menu_b_joint_wheel_info,3, "Axis y");
	dks_button_add_text(menu_b_joint_wheel_info,4, "Motor enable");
	dks_button_add_text(menu_b_joint_wheel_info,5, "Max motor torque");
	dks_button_add_text(menu_b_joint_wheel_info,6, "Motor speed");
	dks_button_add_text(menu_b_joint_wheel_info,7, "Frequency in hz");
	dks_button_add_text(menu_b_joint_wheel_info,8, "Damping ratio");
	dks_button_add_text(menu_b_joint_wheel_info,9, "Collidable");
}