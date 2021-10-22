function dks_object_transform_set() 
{
	var ob = asset_get_index(text_input);
	if object_exists(ob)
	{
	 if is_array(target.variables)
	 {
	  target.variables = 0;
	 }
	 target.object_transform = text_input;
	 dks_input_set_text(input_list[| 11],text_input);
	}
	else
	{
	 target.object_transform = noone;
	 target.object_execute = 0;
	 if is_array(target.variables)
	 {
	  target.variables = 0;
	 }
	 dks_input_set_text(input_list[| 11],"-4");
	 dks_message("Resource index does not exists");
	}
}