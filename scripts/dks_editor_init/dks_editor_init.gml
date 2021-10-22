/// @description dks_editor_init
/// Detect if an input box are created.
function dks_editor_init() 
{
	input_created = false;
	// The number of input created.
	input_list = -1;
	//Color object data setter, reusable in many setters...
	dks_color_init();

	// Questions panels (store any question panel associating your custom actions 0 = text info and 1 = script association)
	enum question
	{
	 DeleteLevel,
	 LoadLevelInput,
	 AskLoadLevel,
	 SaveLevelInput,
	 AskReplaceLevel,
	 DeleteVertex,
	 LayerInput,
	 LayerAdd,
	 LayerDel,
	 Close_program,
	 SpriteAdd,
	 FolderAdd,
	 Object_transform,
	 tree_import,
	 tree_export,
	 LevelFolder,
	 DrawMethod
	}
	text_question[question.Close_program][0] = "Would you like to exit? Current level will be saved in a temporary file.";
	text_question[question.Close_program][1] = dks_editor_end;

	text_question[question.DeleteVertex][0] = "Vertex already exist, would you like to delete?";
	text_question[question.DeleteVertex][1] = dks_question_vertex_destroy;
	text_response1 =0;
	text_response2 =0; 
	text_input = 0;

	//MAIN BUTTONS
	//////////////////////////CREATE MODE (create a button reel,
	button_create_mode = dks_button_reel_create("down",13,0,64,128,32,64,16,4,dark_gray,node_color,node_color,dark_gray,spr_button);
	dks_button_add_text_script(button_create_mode,0,"EDIT MODE",   dks_editor_go_to_edit_mode);
	dks_button_add_text_script(button_create_mode,1,"SPRITE MENU", dks_gui_sprite_set);
	dks_button_add_text_script(button_create_mode,2,"SPRITE RESET",dks_image_reset);
	dks_button_add_text_script(button_create_mode,3,"LAYER MENU",  dks_layer_menu);
	dks_button_add_text_script(button_create_mode,4,"LEVEL MENU",  dks_level_menu_create);
	dks_button_add_text_script(button_create_mode,5,"QUICK SAVE",  dks_work_quicksave);
	dks_button_add_text_script(button_create_mode,6,"GRID MENU",   dks_gui_grid_set);
	dks_button_add_text_script(button_create_mode,7,"ROOM SETTERS",dks_gui_room_set);
	dks_button_add_text_script(button_create_mode,8,"AA FILTER",   dks_gui_aa_set);
	dks_button_add_text_script(button_create_mode,9,"V-SYNC",      dks_gui_vsync_set);
	dks_button_add_text_script(button_create_mode,10,"FULL SCREEN",dks_gui_full_screen_set);
	dks_button_add_text_script(button_create_mode,11,"INTERFACE", dks_menu_interface);
	//dks_button_add_text_script(button_create_mode,12,"FFD MODE",dks_editor_go_to_ffd);
	dks_button_add_text_script(button_create_mode,12,"DESTROY ALL",dks_level_destroy);
	////////////////////////////FFD MODE
	/*
	button_ffd_mode = dks_button_reel_create("down",4,0,64,128,32,64,16,4,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	dks_button_add_text_script(button_ffd_mode,0,"RETURN",dks_editor_go_to_create_mode);
	dks_button_add_text_script(button_ffd_mode,1,"ROTATION",dks_gui_rotation_set);
	dks_button_add_text_script(button_ffd_mode,2,"SCALE",dks_gui_scale_set);
	dks_button_add_text_script(button_ffd_mode,3,"TRANSLATE",dks_gui_translate_set);
	*/
	////////////////////////MULTI MODE
	button_multi_mode = dks_button_reel_create("down",7,0,64,128,32,64,16,4,dark_gray,c_navy,c_navy,dark_gray,spr_button);
	dks_button_add_text_script(button_multi_mode, 0, "EDIT MODE",    dks_editor_go_to_edit_mode);
	dks_button_add_text_script(button_multi_mode, 1, "ROTATION (R)", dks_gui_rotation_set);
	dks_button_add_text_script(button_multi_mode, 2, "SCALE (E)",    dks_gui_scale_set);
	dks_button_add_text_script(button_multi_mode, 3, "TRANSLATE (T)",dks_gui_translate_set);
	dks_button_add_text_script(button_multi_mode, 4, "INSPECTOR",    dks_gui_inspector_set);
	dks_button_add_text_script(button_multi_mode, 5, "COLOR (T)",    dks_gui_color_set);
	dks_button_add_text_script(button_multi_mode, 6, "COPY/PASTE",   dks_object_multi_copy_paste);
	//////////////////////////EDIT MODE
	button_edit_mode = dks_button_reel_create("down",18,0,64,128,32,64,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button);
	dks_button_add_text_script(button_edit_mode,0,"CREATE MODE",   dks_editor_go_to_create_mode);
	dks_button_add_text_script(button_edit_mode,1,"SPRITE MENU",     dks_gui_sprite_set);
	dks_button_add_text_script(button_edit_mode,2,"PHYSICS MODE",  dks_editor_go_to_collision_mode);
	dks_button_add_text_script(button_edit_mode,3,"TWEEN MODE",    dks_editor_go_to_tween_mode);
	dks_button_add_text_script(button_edit_mode,4,"INSPECTOR",       dks_gui_inspector_set);
	dks_button_add_text_script(button_edit_mode,5,"VARIABLES MENU",  dks_gui_variables_set);
	dks_button_add_text_script(button_edit_mode,6,"PARTICLE MENU",   dks_gui_particle_set);
	dks_button_add_text_script(button_edit_mode,7,"GRID MENU",       dks_gui_grid_set);
	dks_button_add_text_script(button_edit_mode,8,"COLOR (C)",       dks_gui_color_set);
	dks_button_add_text_script(button_edit_mode,9,"LAYER MENU",      dks_layer_menu);
	dks_button_add_text_script(button_edit_mode,10,"SET CHILDS",     dks_gui_child_set);
	//dks_button_add_text_script(button_edit_mode,11,"SPINE MODE",   dks_editor_go_to_ffd_edit);
	dks_button_add_text_script(button_edit_mode,11,"ROTATION (R)",   dks_gui_rotation_set);
	dks_button_add_text_script(button_edit_mode,12,"SCALE (E)",      dks_gui_scale_set);
	dks_button_add_text_script(button_edit_mode,13,"TRANSLATE (T)",  dks_gui_translate_set);
	dks_button_add_text_script(button_edit_mode,14,"COPY",           dks_gui_object_copy);
	dks_button_add_text_script(button_edit_mode,15,"PASTE",          dks_gui_object_paste);
	dks_button_add_text_script(button_edit_mode,16,"UNDO",           dks_undo);
	dks_button_add_text_script(button_edit_mode,17,"REDO",           dks_redo);


	////////////////////////////////FFD EDIT MODE
	/*
	button_ffd_edit_mode = dks_button_reel_create("down",4,0,64,128,32,64,16,4,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	dks_button_add_text_script(button_ffd_edit_mode,0,"RETURN",dks_editor_go_to_edit_mode);
	dks_button_add_text_script(button_ffd_edit_mode,1,"ROTATION",dks_gui_rotation_set);
	dks_button_add_text_script(button_ffd_edit_mode,2,"SCALE",dks_gui_scale_set);
	dks_button_add_text_script(button_ffd_edit_mode,3,"TRANSLATE",dks_gui_translate_set);
	*/
	/////////////////////////////////////////////////////
	// ANIMATOR MODE
	button_animator_mode = dks_button_reel_create("down",2,0,64,128,32,64,16,4,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button);
	dks_button_add_text_script(button_animator_mode, 0, "EDIT MODE", dks_editor_go_to_edit_mode);
	dks_button_add_text_script(button_animator_mode, 1, "Hide arguments", dks_gui_tween_show_arguments);
	////////////////////////////////////////////////////
	//VERTEX AND PHYSICS
	button_physics_mode = dks_button_reel_create("down",12,0,64,128,32,64,16,4,dark_gray,yellow_pastel,yellow_pastel,node_color,spr_button);
	dks_button_add_text_script(button_physics_mode, 0, "EDIT MODE",    dks_editor_go_to_edit_mode);
	dks_button_add_text_script(button_physics_mode, 1, "PHYSICS PROPS",  dks_gui_physics_set);
	dks_button_add_text_script(button_physics_mode, 2, "CREATE VERTEX",  dks_gui_vertex_set);
	dks_button_add_text_script(button_physics_mode, 3, "MODIFY VERTEX",  dks_gui_vertex_mod_set);
	dks_button_add_text_script(button_physics_mode, 4, "ADD POINT",      dks_gui_vertex_add_set);
	dks_button_add_text_script(button_physics_mode, 5, "DELETE POINT",   dks_gui_vertex_delete_set);
	dks_button_add_text_script(button_physics_mode, 6, "SET JOINT",      dks_gui_joint_set);
	dks_button_add_text_script(button_physics_mode, 7, "FILL TEXTURE",   dks_gui_vertex_texture_set);
	dks_button_add_text_script(button_physics_mode, 8, "EDGE TEXTURE",   dks_gui_path_texture_set);
	dks_button_add_text_script(button_physics_mode, 9, "DESTROY FILL",   dks_gui_vertex_shape_destroy);
	dks_button_add_text_script(button_physics_mode, 10,"DESTROY EDGE",   dks_gui_terrain_destroy);
	dks_button_add_text_script(button_physics_mode, 11,"TERRAIN SET",    dks_gui_terrain_set);
	// Setters:
	//Interface
	dks_menu_interface_init();
	//sprite manager
	dks_menu_sprite_init();
	//Layer manager
	dks_menu_layer_init();
	//Level manager
	dks_menu_level_init();
	//Grid manager
	dks_menu_grid_init();
	//room setters
	dks_menu_room_init();
	//INSPECTOR setter
	dks_menu_inspector_init();
	//variable setter
	dks_menu_variables_init();
	///Terrain setters
	dks_menu_terrain_init();
	//physics setters
	dks_phyprops_init();
	//Joint setters
	dks_joint_init();
	//Particle setter
	dks_particle_init();
	// Closing menus
	menu_b_close = dks_button_create(128,32,32,32,0,8,dark_gray,c_maroon,c_maroon,dark_gray,spr_icon_back);
}