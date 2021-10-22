function dks_draw_method_custom() 
{
	var name = asset_get_index(text_input);
	if script_exists(name)
	{
	 target.draw_method = name;
	 dks_input_set_text(input_list[| 13], text_input);
	}
	else
	{
	 dks_message("The asset does not exist.");
	}
}