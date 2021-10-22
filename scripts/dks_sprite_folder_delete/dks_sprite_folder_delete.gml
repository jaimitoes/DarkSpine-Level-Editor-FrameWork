function dks_sprite_folder_delete() 
{
	var l = sp_map[? sprite_tab[| current_tab]];
	if( l != undefined)
	{
	 ds_list_destroy(l);
	 ds_map_delete(sp_map,sprite_tab[| current_tab]);
	}
	sprite_tab[| current_tab] = "null";
	var s = ds_list_size(sprite_tab);
	var temp_list = ds_list_create();
	for( i =0; i<s; i++)
	{
	 if(sprite_tab[| i] != "null")
	 {
	  ds_list_add(temp_list,sprite_tab[| i]);
  }
	}
	ds_list_clear(sprite_tab);
	current_tab =-1;
	if !ds_list_empty(temp_list)
	{
	 ds_list_copy(sprite_tab,temp_list);
	 s = ds_list_size(sprite_tab);
	 current_tab = s-1;
	}
	ds_list_destroy(temp_list);
}