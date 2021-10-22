/// @description dks_editor_go_to_ffd
function dks_editor_go_to_ffd() 
{
 if (is_spine)
	{
	 x = camera_get_view_x(Cam) + camera_get_view_width(Cam)*0.5;
	 y = camera_get_view_y(Cam) + camera_get_view_height(Cam)*0.5;
	 scale_mode = "pos";
		modo = mode.ffd_create;
		exit;
	}
	else
	{
	 dks_message("This sprite is not a Spine file");
	}
}