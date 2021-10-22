/// @description dks_button_set_colour(button array2d, button_col, button_press, tex_col, tex_press);
/// @param button array2d
/// @param  button_col
/// @param  button_press
/// @param  tex_col
/// @param  tex_press
function dks_button_set_colour(argument0, argument1, argument2, argument3, argument4) 
{
	var s = array_length(argument0);
	for(var i =0; i<s; i++)
	{
	 argument0[i][@6] = argument1;
	 argument0[i][@7] = argument2; 
	 argument0[i][@8] = argument3;
	 argument0[i][@9] = argument4; 
	}
}