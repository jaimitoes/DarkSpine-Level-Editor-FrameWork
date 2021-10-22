function dks_sprite_delete(argument0) 
{
	var list_sprite = sp_map[? sprite_tab[| current_tab]];
	var l = ds_list_create();
	var s = ds_list_size(list_sprite);
	for (var i =0; i<s;i++)
	{
	 if (i != argument0)
	 {
	  ds_list_add(l,list_sprite[| i]);
	 }
	}


	if (ds_list_empty(l))
	{
	 ds_list_destroy(list_sprite);
	 ds_map_delete(sp_map, sprite_tab[| current_tab]);
	 ds_list_destroy(l);
	}
	else
	{
	 ds_list_clear(list_sprite);
	 ds_list_copy(list_sprite,l);
	 ds_list_destroy(l);
	}
}