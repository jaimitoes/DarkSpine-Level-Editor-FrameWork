/// @description scr_bind_set_phy_yoffset(target,xoffset,yoffset)
/// @param target
/// @param xoffset
/// @param yoffset
function scr_bind_set_phy_yoffset(argument0, argument1, argument2) 
{
	var object = argument0
	var xxoff = argument1;
	var yyoff = argument2;
	result = ((xxoff/image_xscale)*sin(degtorad(object.phy_rotation))+(yyoff/image_yscale)* (cos(degtorad(object.phy_rotation))));
	return result;
}