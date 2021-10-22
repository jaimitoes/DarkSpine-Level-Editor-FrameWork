/// @description draw_sprite_button(Button array2D, sprite, x_offset, yoffset, button_color, button_color_press, sprite_color, sprite_color_press)
/// @param Button array2D
/// @param  sprite
/// @param  x_offset
/// @param  yoffset
/// @param  button_color
/// @param  button_color_press
/// @param  sprite_color
/// @param  sprite_color_press
function draw_sprite_button(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) 
{
	var s = array_length(argument0);
	var xf = argument2;
	var yf = argument3;
	var b_col = argument4;
	var b_press = argument5;
	var t_col = argument6;
	var t_press = argument7;
 for (var i =0; i<s;i++)
	{
	 if point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),argument0[i][0], argument0[i][1], argument0[i][2], argument0[i][3])
	 {
	  draw_set_colour(b_press);
	  draw_rectangle(argument0[i][0], argument0[i][1], argument0[i][2], argument0[i][3] ,false);
	  draw_set_colour(t_press);
	  draw_sprite(argument1,0,argument0[i][0]+xf,argument0[i][1]+yf);
	  draw_rectangle(argument0[i][0], argument0[i][1], argument0[i][2], argument0[i][3] ,true);
	 } 
	 else
	 {
	  draw_set_colour(b_col);
	  draw_rectangle(argument0[i][0], argument0[i][1], argument0[i][2], argument0[i][3] ,false);
	  draw_set_colour(t_col);
	  draw_sprite(argument1,0,argument0[i][0]+xf,argument0[i][1]+yf);
	  draw_rectangle(argument0[i][0], argument0[i][1], argument0[i][2], argument0[i][3] ,true);
	 }
	}
}