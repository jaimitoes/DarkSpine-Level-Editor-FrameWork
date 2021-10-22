/// @description dks_draw_button_reel(Button array2D)
/// @param Button array2D
function dks_draw_button_reel(argument0) 
{
	var a = argument0;
	var s = array_length(a);

	for (var i =0; i<s;i++)
	{
	  if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0),a[i][0],a[i][1],a[i][2],a[i][3])
	  {
	   draw_sprite_ext(a[i][15],0,a[i][0],a[i][1],1,1,0,a[i][7],1);
	   draw_sprite_ext(a[i][15],1,a[i][0],a[i][1],1,1,0,a[i][9],1);
	   draw_set_colour(a[i][9]);
	   draw_text(a[i][12],a[i][13],a[i][10]);
	  }
	  else
	  {
	   draw_sprite_ext(a[i][15],0,a[i][0],a[i][1],1,1,0,a[i][6],1);
	   draw_sprite_ext(a[i][15],1,a[i][0],a[i][1],1,1,0,a[i][8],1);
	   draw_set_colour(a[i][8]);
	   draw_text(a[i][12],a[i][13],a[i][10]);
	  }
 
	} 
draw_set_color(c_white);
}