/// @description scr_vertex_add_point(buffer,x,y,depth,u,v,color,alpha)
/// @param buffer
/// @param x
/// @param y
/// @param depth
/// @param u
/// @param v
/// @param color
/// @param alpha
function scr_vertex_add_point(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) 
{
	vertex_position_3d(argument0, argument1, argument2,argument3);
	vertex_texcoord(argument0, argument4, argument5);
	vertex_colour(argument0, argument6, argument7);
}