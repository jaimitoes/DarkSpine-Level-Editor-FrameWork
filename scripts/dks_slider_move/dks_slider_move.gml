/// @description dks_slider_move(slider, input, array)
/// @param slider
/// @param  input
/// @param  array
function dks_slider_move(argument0, argument1, argument2) 
{
	var sl = argument0;
	var p = argument1;
	var a = argument2;
	var d = abs(sl[p][0]-device_mouse_x_to_gui(0));
	a[@ p] = d;
}