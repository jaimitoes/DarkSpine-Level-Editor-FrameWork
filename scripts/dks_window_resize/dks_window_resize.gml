/// @description dks_window_resize(Camera id, Width, Height)
/// @param Camera id
/// @param Width
/// @param Height
function dks_window_resize(argument0, argument1, argument2) 
{
	var c = argument0, w = argument1, h = argument2;
	window_set_size( w, h);
	camera_set_view_size(c, w, h);
	view_set_wport(0,w);
	view_set_hport(0,h);
	view_wport[0] = w
	view_hport[0] = h;
	surface_resize(application_surface, w, h);
	display_set_gui_size( w, h);
	//view_set_xport(0, 0);
	//view_set_yport(0, 0);
}