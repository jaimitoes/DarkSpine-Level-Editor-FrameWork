/// @description dks_editor_scale_x
function dks_editor_scale_x()
{
	var scaler = (Mxd - mouse_startx)*interface[2];
	image_xscale = xsoffset+scaler;
}