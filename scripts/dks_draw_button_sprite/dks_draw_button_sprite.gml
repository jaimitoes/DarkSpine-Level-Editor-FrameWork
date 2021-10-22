/// @description dks_draw_button_sprite(Button array2D)
/// @param Button array2D
function dks_draw_button_sprite(argument0) 
{
	var a = argument0;
	var s = array_length(a);

	for (var i =0; i<s;i++)
	{
	 if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), a[i][0], a[i][1], a[i][2], a[i][3])
	 {
	  draw_sprite_ext(a[i][15], 0, a[i][0], a[i][1], 1, 1, 0, a[i][7],1);
	  draw_sprite_ext(a[i][15], 1, a[i][0], a[i][1], 1, 1, 0, a[i][9],1);
   
	 }
	 else
	 {
	  draw_sprite_ext(a[i][15], 0, a[i][0], a[i][1], 1, 1,0, a[i][6], 1);
	  draw_sprite_ext(a[i][15], 1, a[i][0], a[i][1], 1, 1,0, a[i][8], 1);
  }
 } 
}