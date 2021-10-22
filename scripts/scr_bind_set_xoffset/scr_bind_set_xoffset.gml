/// @description scr_bind_set_xoffset(object, xoffset, yoffset)
/// @param object
/// @param  xoffset
/// @param  yoffset
function scr_bind_set_xoffset(argument0, argument1, argument2) 
{
	var object = argument0,
	xoff = argument1,
	yoff = argument2,
	res_x = xoff *(cos(degtorad(object.image_angle))),
	res_y = yoff*(-sin(degtorad(object.image_angle))),
	result = (res_x+res_y)/object.image_xscale;
	return result;
}