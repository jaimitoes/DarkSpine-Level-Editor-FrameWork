/// @description scr_vertex_add_point_col(buffer,x,y,depth,color,alpha)
/// @param buffer
/// @param x
/// @param y
/// @param depth
/// @param color
/// @param alpha
function scr_vertex_add_point_col(argument0, argument1, argument2, argument3, argument4, argument5) 
{
 vertex_position_3d(argument0, argument1, argument2,argument3);
	vertex_colour(argument0, argument4, argument5);
}