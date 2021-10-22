/// @descrition dks_editor_target_data_create
function dks_editor_target_data_create() 
{
	// Creates a temporal data structure to manage the copy pasting system of our Deco object
	save_sprite =0;
	save_angle =0;
	save_xscale =0;
	save_yscale =0;
	save_blend =0;
	save_depth =0;
	save_alpha =0;
	save_target =noone;
	save_poly_list   = ds_list_create();
	save_poly_offset = ds_list_create();
	save_path_texture = noone;
	save_bezier_n1 =0;
	save_bezier_n2 =0;
	save_parent = false;
	save_variables = 0;
	save_col_xoff = 0;
	save_col_yoff = 0;
	save_corner1_xoff = 0;
	save_corner1_yoff = 0;
	save_corner2_xoff = 0;
	save_corner2_yoff = 0;
	save_activated = 1;
	save_dk_part = 0;
	save_phyprops= ds_list_create();
	save_joint_distance = ds_list_create();
	save_joint_rope = ds_list_create();
	save_joint_revolute = ds_list_create();
	save_joint_prism = ds_list_create();
	save_joint_pulley = ds_list_create();
	save_joint_friction = ds_list_create();
	save_joint_gear = ds_list_create();
	save_joint_weld = ds_list_create();
	save_joint_wheel= ds_list_create();
	save_joint_offset = ds_list_create();
	save_texture = 0;
	save_polygon = 0;
	save_joint = 0;
	save_joint_target = noone;
	save_joint_parent = noone;
	save_tween = 0;
	save_tweenS = 0;
	save_tweenD = 0;
	save_tweenCst = 0;
	save_tweenCed = 0;
	save_tweenCstop = 0;
}