///Exit from the editor

//Save the current workspace and level
dks_workspace_get(obj_deco_creator,obj_deco_creator.level_folder, "temp");

//Check if a workspace exists and then delete it.
 var file = working_directory + "DarkSpine\\workspace.json";
 if file_exists(file)
 {
  file_delete(file);
 }
// Creating a Json map to save the list of the current Interface settings
 var map = ds_map_create();
 var l = ds_list_create();
 l[| 0] = save_level;
 l[| 1] = save_target_number;
 l[| 2] = save_mode;
 l[| 3] = save_setter;
 l[| 4] = grid ;
 l[| 5] = grid_w;
 l[| 6] = grid_h;
 l[| 7] = grid_c;
 l[| 8] = save_view_x;
 l[| 9] = save_view_y;
 l[| 10] = save_layer;
 l[| 11] = save_folder;
 l[| 12] = save_show_bezier;
 l[| 13] = save_show_col;
 l[| 14] = save_all_col;
 //Keying the interface list with the name "workspace" and adding the previous list
 ds_map_add_list(map, "workspace",l);
 var l2 = ds_list_create_from_array(save_interface);
 ds_map_add_list(map,"interface",l2);
//Encoding the the map
 var encode = json_encode(map);
 //Creating a buffer to store the data
 var buffer = buffer_create(1024,buffer_grow,1);
 // Storing the Json in the memory buffer
 buffer_write(buffer,buffer_string,encode);
 //Writing on the hard drive the data
 buffer_save(buffer,file);
 //freeing the buffer from memory
 buffer_delete(buffer);
 //Destroying the temporary map
 ds_map_destroy(map);
//ds_list_destroy(save_bone_list); Under construction
//Destroying all temporary deco data used for the copy/pasting system
ds_list_destroy(save_poly_list);  
ds_list_destroy(save_poly_offset); 
ds_list_destroy(save_phyprops);
ds_list_destroy(save_joint_distance); 
ds_list_destroy(save_joint_rope); 
ds_list_destroy(save_joint_revolute); 
ds_list_destroy(save_joint_prism);
ds_list_destroy(save_joint_pulley); 
ds_list_destroy(save_joint_friction); 
ds_list_destroy(save_joint_gear);  
ds_list_destroy(save_joint_weld); 
ds_list_destroy(save_joint_wheel);
ds_list_destroy(save_joint_offset);
ds_map_destroy(var_map);
////////////
//Destroy the object deco printer 
instance_destroy(obj_deco_creator);
//System restart and go to the DarkSpine´s title
instance_create_depth(0,0,0,Darkspine_launcher);


