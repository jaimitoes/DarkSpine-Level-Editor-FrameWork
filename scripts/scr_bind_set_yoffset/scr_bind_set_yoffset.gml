   ///scr_bind_set_yoffset(xoffset,yoffset,yscale,angle)
function scr_bind_set_yoffset(argument0, argument1, argument2) 
{
	var object = argument0,
	xoff = argument1,
	yoff = argument2,

	var res_x = xoff * sin(degtorad(object.image_angle));
	var res_y = yoff * cos(degtorad(object.image_angle));
	var result;
	result = (res_x+res_y)/object.image_yscale;
	return result;
}