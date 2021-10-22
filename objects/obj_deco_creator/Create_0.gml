/// @description /Darkspine core and script manager
// Deco creator Inerith the par deco event to get the initial deco data.
event_inherited();
//Mouse-Menu Grid variables
mouse_grid_x = 0;
mouse_grid_y = 0;
Dx = device_mouse_x_to_gui(0);
Dy = device_mouse_y_to_gui(0);
Dxoff = Dx;
Dyoff = Dy;
grid = false;
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
// The mouse rectangle selector 
gui_rectangle = 0;
// Initial Display data (get your current display info)
display_w = display_get_width();
display_h = display_get_height();
//Fps, vertex texture info and vertex batches
debug_overlay =0;
/// The window surface initial size in Non Full Screen mode
window_w = 1280;
window_h = 720;
// Initial vertical Sync and anti-aliasing filter
vsync = true;
a_a = 0;
// The texture interpolation on images in every draw
texture_interpolation = true;
//Interface boolean
show_interface = true;
// Vertex terrain gui 
highlight_vertex = 0;
show_bezier = 0;
highlight_vertex_draw[0] = 0;
highlight_vertex_draw[1] = 0;
highlight_vertex_draw[2] = 0;
highlight_vertex_draw[3] = 0;
//display_reset(a_a,vsync);
// The nearest object that can be selected with the mouse
near = noone;
//sprite-show surface ( The surface used to show sprites on the Sprite Menu
sf_sprite =0;
///Initial Deco Creator coordinates
x = room_width*0.5;
y = room_height*0.5;
// Menu setter variable (Finite state machine without using conditionals, all states are stored in scripts)
menu_setters = setter.closed;
///Json sprite map created to manage our Sprite Menu
sp_map = ds_map_create();
sprite_tab = ds_list_create();
current_tab = -1;
sprite_index =  spr_icon_object;
/// The Ui interface, store all buttons and expand its functionalitys
dks_editor_init();///Load buttons
//Editor modes [auto execute state machines, store your states] (follow the enumerator order)
script_mode[mode.create] = dks_mode_create;
script_mode[mode.edit] = dks_mode_edit;
//script_mode[mode.ffd_create] = dks_mode_ffd_create;
//script_mode[mode.ffd_edit] = dks_mode_ffd_edit;
script_mode[mode.multiple] = dks_mode_multi_edit;
script_mode[mode.animator] = dks_mode_animator;
script_mode[mode.polygon]  = dks_mode_polygon;
//Ui DRAW STATES MACHINES (You can expand infinitely this section, like the script setters...) (follow the enumerator order)
mode_draw[mode.create] = dks_menu_draw_create_mode;
mode_draw[mode.edit] = dks_menu_draw_edit_mode;
//mode_draw[mode.ffd_create] = draw_mode_ffd_create;
//mode_draw[mode.ffd_edit] = draw_mode_ffd_edit;
mode_draw[mode.multiple] = dks_menu_draw_multiple_mode;
mode_draw[mode.animator] = dks_menu_draw_animator_mode;
mode_draw[mode.polygon] = dks_menu_draw_polygon_mode;
////////////////////////////////////////////////////////////////////////
//Editor setters states (follow the enumerator order) [Array state machine]
script_setters[setter.sprite] = dks_setter_sprite;
script_setters[setter.level]  = dks_setter_level;
script_setters[setter.layer] = dks_setter_layer;
script_setters[setter.grid] = dks_setter_grid;
script_setters[setter.color] = dks_setter_color;
script_setters[setter.inspector] = dks_setter_inspector;
script_setters[setter.bind] = dks_setter_bind;
script_setters[setter.vector] = dks_setter_vector_set;
script_setters[setter.vector_mod] = dks_setter_vector_mod;
script_setters[setter.vector_add] = dks_setter_vector_add;
script_setters[setter.vector_del] = dks_setter_vector_del;
script_setters[setter.joint] = dks_setter_joint;
script_setters[setter.physet] = dks_setter_physics;
script_setters[setter.sprite_path] = dks_setter_sprite;
script_setters[setter.terrain] = dks_setter_terrain;
script_setters[setter.room_setters] = dks_setter_room;
script_setters[setter.variables] = dks_setter_variable;
script_setters[setter.particles] = dks_setter_particle;
script_setters[setter.interface] = dks_setter_interface;
//script_setters[setter.scripting] = dks_setter_script;
// //SETTERS DRAW STATES MACHINES (follow the enumerator order, if a setter does not draw anything, set scr_null)
script_draw[setter.sprite] = dks_menu_draw_sprite;
script_draw[setter.level] =  dks_menu_draw_level;
script_draw[setter.layer] =  dks_menu_draw_layer;
script_draw[setter.grid] =   dks_menu_draw_grid;
script_draw[setter.color] =  dks_menu_draw_colour;
script_draw[setter.inspector] = dks_menu_draw_inspector;
script_draw[setter.bind] =   dks_null;
script_draw[setter.vector] = dks_null;
script_draw[setter.vector_mod] = dks_null;
script_draw[setter.vector_add] = dks_null;
script_draw[setter.vector_del] = dks_null;
script_draw[setter.joint] =  dks_menu_draw_joint;
script_draw[setter.physet] = dks_menu_draw_physics;
script_draw[setter.sprite_path] = dks_menu_draw_sprite;
script_draw[setter.terrain] =     dks_menu_draw_terrain;
script_draw[setter.room_setters] = dks_menu_draw_room;
script_draw[setter.variables] = dks_menu_draw_variables;
script_draw[setter.particles] = dks_menu_draw_particle;
script_draw[setter.interface] = dks_menu_draw_interface;
////Interface Buffer ( draw the geometry/object data info)
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
format_col = vertex_format_end();
buffer_col = vertex_create_buffer();
///Editor nodes (Created to control the vertex nodes data)
node = 0;
//bones data, temporaly saving....(Pending review)
/*
bx[0] = 0;
by[0] = 0;
bangle[0] = 0;
bxscale[0] = 0;
byscale[0] = 0;
bx_local[0] = 0;
by_local[0] = 0;
ob_ffd[0]= 0;
*/
////////////////
//The initial image data for the creator object.
image_speed =0;
image_alpha = 0.5;
//The menu variables for the editor.
modo = mode.create;//The current mode;
last_modo = modo;//The previous mode;
last_setter = menu_setters;//The previous setter;
target = noone; ///Managing the selected Deco object;
target_ob = noone;///Secondary variable Deco manager;
multitarget = 0;///When more than 1 object is selected;
last_copy = noone;///Access to the last Deco object id to get the Data;
scale_mode= "pos"; // Scratch pad setter, switch between scale, traslation and rotation;
pos_edit = "xy";// Switch the traslation transforation between x axis, y axis or both.
scale_edit ="x";// Switch the scale transformation between x axis, y axis or both.

ffd_created=0;//Under construction, check if a free form deformation node are created.
obj_scale_created =0; //Check the scale_mode variable, creating a scratch pad analogue button.
joint_target_set =0; // When this variable is true, touch a secondary object to link a targeted object.
//PHYSICS WORLD PROPERTIES ( Manage the world settings from the editor) 
physics_pause = 0;
physics_grav_x = 0;
physics_grav_y = 30;
physics_p_to_m = 0.1;
physics_iterations = 10;
physics_update_speed = 120;
// Flush the GPU texture memory when the level is loaded.
texture_flushing = false;
/// World History System (Undo-Redo actions)
undo_map = ds_map_create();
step_undo = 0;
total_undo = 0;
dks_set_offset(id, Mxd, Myd);
draw_set_font(fontGGUI);
locked = true;
//Editor camera
instance_create_depth(x,y,31999,obj_cam_editor);
// Hightlighting the nearest object
instance_create_depth(x,y,depth,obj_draw_near);
// Object Grid System
instance_create_depth(0,0,depth,obj_grid);
instance_create_depth(0,0,0,obj_room_buffer);
//instance_create_depth(0,0,0,obj_room_buffer);
// Set the variables to get the camera matrices and view size/pos
vcam = camera_get_view_mat(Cam);
pcam = camera_get_proj_mat(Cam);
Dw = display_get_gui_width();
Dh = display_get_gui_height();
Cx = camera_get_view_x(Cam);
Cy = camera_get_view_y(Cam);