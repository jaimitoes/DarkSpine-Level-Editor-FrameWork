/// @description dks_draw_button_rectangle(Button array2D)
/// @param Button array2D
function dks_draw_button_rectangle(argument0) 
{
	var b = argument0;
	var s = array_length(b);

	for (var i =0; i<s;i++)
	{
	 if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),b[i][0], b[i][1], b[i][2], b[i][3])
	 {
	  draw_set_colour(b[i][7]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,false);
	  draw_set_colour(b[i][9]);
  
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,true);
	 } 
	 else
	 {
	  draw_set_colour(b[i][6]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,false);
	  draw_set_colour(b[i][8]);
	  draw_rectangle(b[i][0], b[i][1], b[i][2], b[i][3] ,true);
	 }
	}
}