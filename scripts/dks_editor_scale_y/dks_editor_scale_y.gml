/// @description dks_editor_scale_y
function dks_editor_scale_y() 
{
	var scaler = (Myd-mouse_starty)*interface[2];
	image_yscale = ysoffset-scaler;
}