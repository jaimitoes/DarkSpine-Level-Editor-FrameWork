/// @description  Physics properties
function dks_phyprops_init() 
{
	menu_b_phy_main = dks_button_create(128,64,256,32,128,16,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_256);
	dks_button_add_text_script(menu_b_phy_main,0,"ADD PHYSICS", dks_gui_physics_set_props); 
	menu_b_phy_info = dks_button_reel_create("down",14,128,96,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_phy_info,0,"SHAPE TYPE");
	dks_button_add_text(menu_b_phy_info,1,"DENSITY");
	dks_button_add_text(menu_b_phy_info,2,"RESTITUTION");
	dks_button_add_text(menu_b_phy_info,3,"GROUP");
	dks_button_add_text(menu_b_phy_info,4,"LINEAR DAMP");
	dks_button_add_text(menu_b_phy_info,5,"ANGULAR DAMP");
	dks_button_add_text(menu_b_phy_info,6,"FRICTION");
	dks_button_add_text(menu_b_phy_info,7,"AWAKE");
	dks_button_add_text(menu_b_phy_info,8,"IS SENSOR");
	dks_button_add_text(menu_b_phy_info,9,"IS KINEMATIC");
	dks_button_add_text(menu_b_phy_info,10,"FIXED ROTATION");
	dks_button_add_text(menu_b_phy_info,11,"JOINT TYPE");
	dks_button_add_text(menu_b_phy_info,12,"ACTIVE");
	dks_button_add_text(menu_b_phy_info,13,"SHAPE SCALE");

	menu_b_phy_int =  dks_button_reel_create("down",14,256,96,128,32,8,4,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_script(menu_b_phy_int,physics.shape, dks_gui_physics_set_shape);
	dks_button_add_script(menu_b_phy_int,physics.awake, dks_gui_physics_set_awake);
	dks_button_add_script(menu_b_phy_int,physics.sensor, dks_gui_physics_set_sensor);
	dks_button_add_script(menu_b_phy_int,physics.kine, dks_gui_physics_set_kine);
	dks_button_add_script(menu_b_phy_int,physics.fixed_rotation, dks_gui_physics_set_fixed_rotation);
	dks_button_add_script(menu_b_phy_int,physics.joint_type, dks_gui_physics_set_joint_type);
	dks_button_add_script(menu_b_phy_int,physics.active, dks_gui_physics_set_active);
}