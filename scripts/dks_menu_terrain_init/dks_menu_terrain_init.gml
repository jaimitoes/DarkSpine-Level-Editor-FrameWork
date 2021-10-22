function dks_menu_terrain_init() 
{
	menu_b_terrain_info = dks_button_reel_create("down",12,128,64,128,32,64,16,4,dark_gray,c_aqua,c_aqua,dark_gray,spr_button);
	menu_b_terrain_int = dks_button_reel_create("down",12,256,64,128,32,8,0,4,dark_gray,dark_gray,c_aqua,dark_gray,spr_button);
	dks_button_add_text(menu_b_terrain_info, 0,"SMOOTH");
	dks_button_add_text(menu_b_terrain_info, 1, "H-SPLIT");
	dks_button_add_text(menu_b_terrain_info, 2, "v-SPLIT");
	dks_button_add_text(menu_b_terrain_info, 3, "CORNER LEFT");
	dks_button_add_text(menu_b_terrain_info, 4, "CORNER RIGHT");
	dks_button_add_text(menu_b_terrain_info, 5, "SEGMENT SPLIT");
	dks_button_add_text(menu_b_terrain_info, 6, "COL-XOFFSET");
	dks_button_add_text(menu_b_terrain_info, 7, "COL-YOFFSET");
	dks_button_add_text(menu_b_terrain_info, 8, "CORNER_L_XOFF");
	dks_button_add_text(menu_b_terrain_info, 9, "CORNER_L_YOFF");
	dks_button_add_text(menu_b_terrain_info, 10, "CORNER_R_XOFF");
	dks_button_add_text(menu_b_terrain_info, 11, "CORNER_R_YOFF");
	//dks_button_add_text(menu_b_terrain_info,12, "INVERT");
	dks_button_add_script(menu_b_terrain_int, 0, dks_gui_terrain_set_smooth);
	dks_button_add_script(menu_b_terrain_int, 1, dks_gui_terrain_set_splits);
	dks_button_add_script(menu_b_terrain_int, 2, dks_gui_terrain_set_splits);
	dks_button_add_script(menu_b_terrain_int, 3, dks_gui_terrain_set_corner);
	dks_button_add_script(menu_b_terrain_int, 4, dks_gui_terrain_set_corner);
	dks_button_add_script(menu_b_terrain_int, 5, dks_gui_terrain_set_segment);
	dks_button_add_script(menu_b_terrain_int, 6, dks_gui_terrain_set_collider);
	dks_button_add_script(menu_b_terrain_int, 7, dks_gui_terrain_set_collider);
	dks_button_add_script(menu_b_terrain_int, 8, dks_gui_terrain_set_collider);
	dks_button_add_script(menu_b_terrain_int, 9, dks_gui_terrain_set_collider);
	dks_button_add_script(menu_b_terrain_int, 10, dks_gui_terrain_set_collider);
	dks_button_add_script(menu_b_terrain_int, 11, dks_gui_terrain_set_collider);
	//dks_button_add_script(menu_b_terrain_int,12,dks_vertex_invert);
}