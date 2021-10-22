/// @description scr_bind_set_xoffset(target,xoffset,yoffset)
/// @param target
/// @param xoffset
/// @param yoffset
function scr_bind_set_phy_xoffset(argument0, argument1, argument2) 
{
	var object = argument0;
	var xxoff = argument1;
	var yyoff = argument2;
 var result;
 result = ((xxoff/object.image_xscale)*cos(degtorad(object.phy_rotation))+ (yyoff/object.image_yscale) *(sin(degtorad(object.phy_rotation))));
 return result;
}