function dks_editor_go_to_create_mode() 
{
	scale_mode ="pos"; modo = mode.create;
	depth = lay_depth;
	dks_cam_update_z(obj_cam_editor,obj_cam_editor.Cx,obj_cam_editor.Cy,lay_depth);
}