/// @description Load editor scripting info
// This function store the variable data information (strings) from a custom object that uses the var "variables" to
// get the ability to set initial data from the editor and see the results in real time.
dks_editor_scripting_init();
///Workspace profile///////
// Every time we leave our editor to test our final game (you can exit the editor by pressing the ESC key), our workspace will be saved automatically. 
//When we reload our editor, the last workspace will be loaded.
var file = working_directory + "DarkSpine\\workspace.json";
if(file_exists(file))
{
 var buffer_update = buffer_load(file);
 var data_buffer = buffer_read(buffer_update,buffer_string);
 var map_work = json_decode(data_buffer);
 var workspace = map_work[? "workspace"];
 save_level = workspace[| 0];//if is string, the level name is saved 
 save_target_number = workspace[| 1];
 save_mode = workspace[| 2];
 save_setter = workspace[| 3];
 grid = workspace[| 4];
 grid_w= workspace[| 5];
 grid_h= workspace[| 6];
 grid_c= workspace[| 7];
 save_view_x = workspace[| 8];
 save_view_y = workspace[| 9];
 save_layer = workspace[| 10];
 save_folder = workspace[| 11];//folder
 save_show_bezier = workspace[| 12];
 save_show_col = workspace[| 13];
 save_all_col = workspace[| 14];
 save_interface = dks_array_create_from_list(map_work[? "interface"])
 buffer_delete(buffer_update);
 ds_map_destroy(map_work);
}
else
{
 // If your project does not contains any saved workspace ( a Json file stored on the root appData project), a blank workspace are created.
 save_level = -1;
 save_target_number = noone;
 save_mode = -1;
 save_setter = -1;
 grid_w= 64;
 grid_h= 64;
 grid_c= c_white;
 save_view_x = room_width*0.5;
 save_view_y = room_height*0.5;
 save_layer = 0;
 save_interface = 0;
 save_show_bezier = 0;
 save_show_col = 0;
 save_all_col = 0;
 //save_cam =960;
}
///////////////////////////
// This global variables manage the DarkSpine´s collider debuger
global.show_collision = false;
global.all_collision = false;
dks_enumerator();
// temporal saving
dks_editor_target_data_create();
// activating world physics
physics_world_update_speed(room_speed*2);
physics_world_update_iterations(10);
// save the x and y position of our Editor Cam.
x = save_view_x;
y = save_view_y;
// Start and Stop the simulation with these virtual keys.
button_play[0][0] = 0;//x1 
button_play[0][1] = 0;// y1
button_play[0][2] = 64;// x2
button_play[0][3] = 64;//y2

button_play[1][0] = 64;//x1 
button_play[1][1] = 0;// y1
button_play[1][2] = 128;// x2
button_play[1][3] = 64;//y2

is_playing = false; 
t_var1 =0;

//directorys
if !directory_exists(working_directory + "DarkSpine\\Levels")
{
 directory_create(working_directory+ "DarkSpine\\Levels");
}

if !directory_exists(working_directory+"DarkSpine\\Levels\\Default")
{
 directory_create(working_directory+"DarkSpine\\Levels\\Default");
 
}

if !directory_exists(working_directory+"DarkSpine\\TexturePacks")
{
 directory_create(working_directory+"DarkSpine\\TexturePacks");
}


// Tilt effect for the play buttons...
bt_play = TweenCreate(id,EaseOutQuad,TWEEN_MODE_PATROL,true,0,1,"image_blend",c_white,c_red);
TweenPlay(bt_play);   
// Launch the 3D printer... This object is responsible 
with(instance_create_depth(x,y,save_layer,obj_deco_creator))
{
  if(other.save_level !=-1)
  {
   dks_workspace_set(other.id,other.save_folder ,other.save_level);
  }
}




