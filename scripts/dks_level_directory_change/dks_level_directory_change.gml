function dks_level_directory_change() 
{
	if directory_exists(working_directory + "DarkSpine\\Levels\\"+text_input)
	{
	 ds_list_destroy(level_list);
	 level_folder = text_input;
	 dks_button_add_text(button_level_folder_info, 0,"DIRECTORY: "+ level_folder);
	 dks_level_list_create(level_folder);
	 dks_level_menu_create();
	}
	else
	{
	 dks_message("This Directory does not exist...");
	}
}