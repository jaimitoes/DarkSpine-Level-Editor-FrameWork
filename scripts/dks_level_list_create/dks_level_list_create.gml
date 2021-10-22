/// @description dks_level_list_create(Folder name)
/// @param Folder name
function dks_level_list_create(argument0) 
{
	var l_list = working_directory + "DarkSpine\\Levels\\"+argument0+"\\"+"LEVEL_LIST.json";
	if file_exists(l_list)
	{
	   var map = dks_map_from_json(l_list);
	   level_list = dks_list_create_from_map(map[? "level_list"]);
	   ds_map_destroy(map);
	}
	else
	{
	 dks_message("Level list data not found.");
	 if ds_exists(level_list, ds_type_list)
	 {
	  ds_list_destroy(level_list);
	 }
	 level_list = ds_list_create();
	 menu_setters = setter.closed;
	}
}