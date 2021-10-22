/// @description dks_editor_scale_xy
function dks_editor_scale_xy() 
{
	var scaler = (Mxd-mouse_startx)*interface[2];
	image_xscale = xsoffset+scaler;
	image_yscale = image_xscale*ysoffset/xsoffset;
}