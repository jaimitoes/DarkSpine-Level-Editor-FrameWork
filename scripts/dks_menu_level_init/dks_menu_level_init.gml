function dks_menu_level_init() 
{
	// selecting and saving levels
	// level settings
	menu_b_level_select =0;
	menu_b_level_del =0;
	level_reorder = -1;
	level_name = "temp";
	level_list = 0;
	level_folder = "Default";
	time_save_level = room_speed*600;
	dks_level_list_create(level_folder);
	text_question[question.SaveLevelInput][0] = "Insert the level NAME to SAVE.";
	text_question[question.SaveLevelInput][1] = dks_level_input_save;
	text_question[question.DeleteLevel][0] = "Would you like to DELETE this LEVEL?  : ";
	text_question[question.DeleteLevel][1] = dks_level_question_delete;
	text_question[question.LoadLevelInput][0] =   "Insert the level NAME : ";
	text_question[question.LoadLevelInput][1] = dks_level_input_load; 
	text_question[question.AskLoadLevel][0] = "Would you like to LOAD this LEVEL?  : ";
	text_question[question.AskLoadLevel][1] = dks_level_question_load;
	text_question[question.AskReplaceLevel][0] = "Warning! A level with this name already exist. ¿ Would you like to replace it?";
	text_question[question.AskReplaceLevel][1] = dks_level_question_replace;
	text_question[question.LevelFolder][0] = "Insert the DIRECTORY name: ";
	text_question[question.LevelFolder][1] = dks_level_directory_change;

	menu_b_level_str = dks_button_reel_create("right",2,128,64,128,32,64,16,4,dark_gray,node_color,node_color,dark_gray,spr_button);
	button_level_folder_info = dks_button_create(128,0,256,32,128,16,dark_gray,node_color,node_color,dark_gray,spr_button_256);
	button_level_name_info = dks_button_create(386,0,256,32,128,16,dark_gray,node_color,node_color,dark_gray,spr_button_256);
	dks_button_add_text(button_level_folder_info, 0, "DIRECTORY: "+ level_folder);
	dks_button_add_text(button_level_name_info, 0, "LEVEL: "+ level_name);

	dks_button_add_text(menu_b_level_str,0,"LOAD LEVEL");
	dks_button_add_text(menu_b_level_str,1,"SAVE LEVEL");
}