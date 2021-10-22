function dks_sprite_folder_add() 
{
	var s = ds_list_size(sprite_tab);
	for (var i =0; i<s; i++)
	{
	 if(text_input = sprite_tab[| i])
	 {
	  dks_message("Folder name already exists");
	  exit;
	 }
	}

	sprite_tab[| s] = text_input;
	current_tab = s;
}