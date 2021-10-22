/// @description dks_workspace_set( Object from, Level_folder, level name)
/// @param  Object from
/// @param  Level_folder
/// @param  level name
function dks_workspace_set(argument0, argument1, argument2) 
{
	var source = argument0;
	level_folder = argument1;
	level_name = argument2;
	dks_button_add_text(button_level_folder_info, 0, "DIRECTORY: "+ level_folder);
	if ds_exists(level_list, ds_type_list)
	{
	 ds_list_destroy(level_list);
	}
	dks_level_list_create(level_folder);
	dks_work_load(level_folder,level_name);
	if(source.save_target_number !=noone)
	{
	 target = instance_find(obj_deco,source.save_target_number);
	}
 obj_cam_editor.target = target;
	obj_cam_editor.view_xoffset = source.save_view_x;
	obj_cam_editor.view_yoffset = source.save_view_y;
	obj_cam_editor.x = source.save_view_x;
	obj_cam_editor.y = source.save_view_y;
	obj_cam_editor.target_view = 1;
 
	show_bezier = source.save_show_bezier;
	global.show_collision = source.save_show_col;
	global.all_collision = source.save_all_col;
	modo = source.save_mode;
	last_modo = source.save_mode;
	menu_setters = source.save_setter;
	last_setter  = source.save_setter;
	lay_depth = source.save_layer;
	if(target != noone)
	{
	 depth = target.depth;
		sprite_index = target.sprite_index;
		image_index = target.image_index;
 }
	else
	{
	 depth = lay_depth;
 }
	dks_cam_update_z(obj_cam_editor, camera_get_view_x(Cam), camera_get_view_y(Cam), depth);
 grid = source.grid;
	grid_width = source.grid_w;
	grid_height = source.grid_h;
	grid_color = source.grid_c;
	slider_val[@ 0] = color_get_hue(grid_color);
	slider_val[@ 1] = color_get_saturation(grid_color);
	slider_val[@ 2] = color_get_value(grid_color);
	
 var a = source.save_interface;
	var s = array_length(a)
	for (var i =0; i<s; i++)
	{
	 interface[@ i] = a[i];
	}
	obj_cam_editor.zoom_trans = interface[0];
	icon_scale = interface[1];
 switch(modo)
	{
	 case mode.animator: instance_create_depth(x,y,source.save_layer,obj_motion_controller);
	}
	switch(menu_setters)
	{
	 case setter.layer: dks_layer_menu();break;
	 case setter.color:
	 if(target!=noone)
	 {
	  blend_color[0] = target.bl_h;
	  blend_color[1] = target.bl_s;
	  blend_color[2] = target.bl_v;
	 } 
	 break;
	}
}