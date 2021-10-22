/// @description dks_button_press(array of buttons);
/// @param array of buttons
function dks_button_press(argument0) 
{
	var size = array_length(argument0);
	var val = -1;
	for (var i =0;i<size;i++)
	{
	  if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),argument0[ i][0],argument0[ i][1],argument0[ i][2],argument0[ i][3]))
	  {
	   val = i;
	   return val; exit;
	  }
 
	}
	return val;
}