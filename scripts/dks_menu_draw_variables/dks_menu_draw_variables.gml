function dks_menu_draw_variables() 
{
	dks_draw_button_reel(button_variables_create);
	if is_array(button_variables_info)
	{
	 dks_draw_button_reel(button_variables_info);
	 dks_draw_button_reel(button_variables_int);
	}
}