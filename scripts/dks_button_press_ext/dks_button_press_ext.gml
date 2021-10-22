/// @description dks_button_press_ext(array of buttons,mouse_device);
/// @param array of buttons
/// @param mouse_device
function dks_button_press_ext(argument0, argument1) 
{
	var size = array_length(argument0);
	var val = -1;
	for (var i =0;i<size;i++)
	{
	  if(point_in_rectangle(device_mouse_x_to_gui(argument1),device_mouse_y_to_gui(argument1),argument0[ i][0],argument0[ i][1],argument0[ i][2],argument0[ i][3]))
	  {
	   val = i;
	   return val; exit;
	  }
 
	}
	return val;
}