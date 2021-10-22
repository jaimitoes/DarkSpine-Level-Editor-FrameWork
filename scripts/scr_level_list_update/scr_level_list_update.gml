/// @description dks_level_list_update(Folder name)
/// @param Folder name
function scr_level_list_update(argument0) 
{
	//UPDATING OUR LEVEL LIST
	// Get the name of the current level
	var l_list = working_directory + "DarkSpine\\Levels\\"+argument0+"\\"+"LEVEL_LIST.json";
	// if this one exists, delete it
	if file_exists(l_list)
	{
	 file_delete(l_list);
	} 
	// Set as undefined any level with the same name
	var size = ds_list_size(level_list);

	for (var i =0; i<size;i++)
	{
	 if level_list[| i] = level_name
	 {
	  level_list[| i] = undefined;
	 }
	}

	// Add the new level
	if (level_name != "null")
	{
	level_list[| size] = level_name;
	size+=1;
	}                   
	// Create a new list to reorganize the structre
	var save_level_list = ds_list_create();

	// Updating levels
	for (var i =0; i<size;i++)
	{
	 if  (!is_undefined(level_list[| i]))
	 {
	  ds_list_add(save_level_list,level_list[| i]);
	 }
	}
	// Clear the default list
	ds_list_clear(level_list);
	// Copy the updated list into th default list
	ds_list_copy(level_list,save_level_list);
	// Destroy the temporary list
	ds_list_destroy(save_level_list);
	// Store the updated list into a file
	if !ds_list_empty(level_list)
	{
	 var level_map = ds_map_create();
	 var temp_list = ds_list_create();
	 ds_list_copy(temp_list,level_list);
	 ds_map_add_list(level_map,"level_list",temp_list);
	 var json = json_encode(level_map);
	 var buffer = buffer_create(1024,buffer_grow,1);
	 buffer_write(buffer,buffer_string,json);
	 buffer_save(buffer,l_list);
	 buffer_delete(buffer);
	 ds_map_destroy(level_map);
	 dks_level_menu_create();
	}
	else
	{
	 // Destroy the level menu	
	 menu_b_level_select = 0;
	 menu_b_level_del = 0;
	}
}