function dks_sprite_tree_export() 
{
	if ds_map_empty(sp_map)
	{
	 dks_message("Resoure tree structure has not been  defined");
	}
	else
	{
	 var l = ds_list_create();
	 ds_list_copy(l,sprite_tab);
	 ds_map_add_list(sp_map,"sprite_tab",l);
	 dks_map_json_export(sp_map,working_directory+"DarkSpine\\TexturePacks\\"+text_input+".json");
	 ds_map_delete(sp_map,"sprite_tab");
	 dks_message("Resource tree exported successfully");
	}
}