function dks_sprite_add() 
{
 var asset = asset_get_index(text_input);
 if (asset = -1)
	{
	 dks_message("Resource does not exists!");
	 exit;
	} 
	var list_sprite = sp_map[? sprite_tab[| current_tab]];
	if (list_sprite != undefined)
	{
	 var s = ds_list_size(list_sprite);
	 for(var i =0; i<s; i++)
	 {
	  if (text_input = list_sprite[| i])
	  {
	   dks_message("Resource already exists");
	   exit;
	  }
	 }
	 ds_list_add(list_sprite, text_input);
	}
	else
	{
	 list_sprite = ds_list_create();
	 ds_list_add(list_sprite, text_input);
	 ds_map_add_list(sp_map,sprite_tab[| current_tab],list_sprite);
	}
}