/// @description dks_grid_draw(grid_widht,grid_height)
/// @param grid_widht
/// @param grid_height
function dks_grid_draw(argument0, argument1) 
{
	var i;
	for (i = 0; i < room_width; i += argument0)
	{
	    draw_line_colour(i, 0, i, room_height,grid_color,grid_color);
	}

	for (i = 0; i < room_height; i += argument1)
	{
	    draw_line_colour(0, i, room_width, i,grid_color,grid_color);
	}
}