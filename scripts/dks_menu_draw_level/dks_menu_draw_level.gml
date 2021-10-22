function dks_menu_draw_level() 
{
	if is_array(menu_b_level_select)
	{
	 dks_draw_button_reel(menu_b_level_str);
	 dks_draw_button_reel(menu_b_level_select);
	 dks_draw_button_reel(menu_b_level_del);
 }
	dks_draw_button_reel(button_level_folder_info);
	dks_button_add_text(button_level_name_info, 0, "LEVEL: "+ level_name);
	dks_draw_button_reel(button_level_name_info);
}