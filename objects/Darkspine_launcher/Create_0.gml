/// @description Darkspine updater////////Don´t touch
//DarkSpine level update system
// This variable controls the update checking this value with the Json file "dk_version" stored in the root project folder of our local data.
darkspine_version = 0.838;
// The 2D array controls the update script ordering depending of our current version.
upgrade[0][0] = 0.837;
upgrade[0][1] = dks_upgrade_0_837;
upgrade[1][0] = 0.838;
upgrade[1][1] = dks_upgrade_1_838;
ini_open(working_directory);
// Check the last DarkSpine version installed on the computer.
var file = working_directory + "DarkSpine\\dk_version.json";
var buffer_update = buffer_load(file);
var data_buffer = buffer_read(buffer_update,buffer_string);
var map_version = json_decode(data_buffer);
dk_version = map_version[? "version"]; 
// Check if the current variable "darkspine_version" match with the lastest version stored in the extension.
if(dk_version < darkspine_version)
{
 // if our JSON file have a lower value, DarkSpine execute the update system by passing all the scripts inserted on the 2D array upgrader "upgrade".
 dks_darkspine_update();
 // Once the update are finished, we store the new version data value to the Json file
 var vm = ds_map_create();
 vm[? "version"] = darkspine_version;
 var json_version = json_encode(vm);
 var buffer = buffer_create(8,buffer_grow,1);
 buffer_write(buffer,buffer_string,json_version);
 buffer_save(buffer,working_directory + "DarkSpine\\dk_version.json");
 buffer_delete(buffer);
 ds_map_destroy(vm);
 // Cout a succesffuly update message
 dks_message("Darkspine updated");
}
 // Destroy from memory the buffer update
buffer_delete(buffer_update);
ds_map_destroy(map_version);
///////////////////////////////////
/////////////////////////////////////////////
//window_set_fullscreen(1);
//Apply an application surface for mobile phones, other.idwise, for desktop devices, deactivate this
if(os_type = os_android)
{
 show_debug_overlay(1);
 application_surface_enable(1);
 display_reset(0,0);
 os_powersave_enable(0);//Disable power save mode (more performance)
}
else
{
 application_surface_enable(0);
 display_reset(0,1);
} 
// Set the global variables for the camera aspect ratio and viewsize
global.ratio = 1;
global.Zoom = 1;
global.start_3d = 1;
//gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);
gpu_set_cullmode(0);
gpu_set_texrepeat(1);
// Set 2 global mouse variables to set into each one the coordinates depending if we are using the z-buffer or not.
global.mouse_xd = mouse_x;
global.mouse_yd = mouse_y;
// Create a default matrix world
global.mat_world = [ 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 ];
/// Creating a 2d and 3d camera
view_camera[0] = camera_create_view( 0, 0, 1280, 720);
view_camera[1] = camera_create_view( 0, 0, 1280, 720);
view_enabled = 1;
#macro Cam view_camera[0]
#macro Cam3D view_camera[1]
// Set the camera position at the top left corner
view_set_camera(0,Cam);
view_set_camera(1,Cam3D);
camera_set_view_pos(Cam,0,0);
camera_set_view_pos(Cam3D,0,0);
view_set_visible(0,0);
view_set_visible(1,1);
// Get the current windows surface application view size.
if (window_get_fullscreen())
{
 original_w = display_get_width();
 original_h = display_get_height();
}
else
{
 original_w = window_get_width();
 original_h = window_get_height();
}
// Load the the level "DarkSpine_launcher" from the folder "Launcher"
dks_level_load("Launcher", "DarkSpine_launcher");
//Destroy the launcher
instance_destroy();