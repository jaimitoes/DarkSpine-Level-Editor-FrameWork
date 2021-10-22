/// @description dks_workspace_get( source object, Folder name ,level name)
/// @param  source object
/// @param  Folder name 
/// @param level name
function dks_workspace_get(argument0, argument1, argument2) 
{
	var creator = argument0;
	save_folder = argument1;
	save_level = argument2;
	save_view_x = camera_get_view_x(Cam)+camera_get_view_width(Cam)*0.5;
	save_view_y = camera_get_view_y(Cam)+camera_get_view_height(Cam)*0.5;
	save_target = creator.target;
	save_mode = creator.modo;
	save_setter = creator.menu_setters;
	save_interface = 0;
	save_interface = creator.interface;//array
	grid = creator.grid;
	grid_w = creator.grid_width;
	grid_h = creator.grid_height;
	grid_c = creator.grid_color;
	save_layer = creator.lay_depth;
	save_show_bezier = creator.show_bezier;
	save_show_col = global.show_collision;
	save_all_col = global.all_collision;

	with(creator)
	{
 
	 dks_editor_go_to_create_mode();
	 dks_destroy_tools();
	 dks_work_save(argument1,argument2);
 
	}
	if(creator.target !=noone)
	{
	 var inst;
	 for (var i= 0; i<instance_number(obj_deco);i++)
	 {
	  inst = instance_find(obj_deco,i);
	  if(inst.id = creator.target)
	  {
	   save_target_number = i;break;
	  }
	 }
	}
	else
	{
	 save_target_number = noone;
	}
	instance_destroy(obj_deco_creator);
}