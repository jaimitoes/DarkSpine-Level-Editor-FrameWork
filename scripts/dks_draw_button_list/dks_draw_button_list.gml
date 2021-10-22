/// @description dks_draw_button_list(Button array2D,text list)
/// @param Button array2D
/// @param text list
function dks_draw_button_list(argument0, argument1) 
{
	var b = argument0;
	var l = argument1;
	var s = array_length(b);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	for (var i =0; i<s;i++)
	{
	 if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),b[i][0], b[i][1], b[i][2], b[i][3])
	 {
	  draw_set_colour(b[i][7]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,false);
	  draw_set_colour(b[i][9]);
	  draw_text(b[i][0]+b[i][4],b[i][1]+b[i][5],l[| i]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,true);
	 } 
	 else
	 {
	  draw_set_colour(b[i][6]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,false);
	  draw_set_colour(b[i][8]);
	  draw_text(b[i][0]+b[i][4],b[i][1]+b[i][5],l[| i]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,true);
	 }
	}
}