function dks_sprite_tree_import() 
{
	if(file_exists(working_directory + "DarkSpine\\TexturePacks\\"+text_input+".json"))
	{
	 ds_list_clear(sprite_tab);
	 current_tab =-1;
	 if ds_exists(sp_map, ds_type_map)
	 {
	  ds_map_destroy(sp_map);
	 }
 
	 sp_map = dks_map_from_json(working_directory+"DarkSpine\\TexturePacks\\"+text_input+".json");
	 ds_list_copy(sprite_tab,sp_map[? "sprite_tab"]);
	 ds_map_delete(sp_map,"sprite_tab");
 
	 dks_message("Resource tree imported successfully");
	}
	else
	{
	 dks_message("Resource tree does not exists");
	}
}