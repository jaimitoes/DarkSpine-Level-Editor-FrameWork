/// @description dks_button_add_colour(button array2d, input number, button_col, button_press, tex_col, tex_press);
/// @param button array2d
/// @param  input number
/// @param  button_col
/// @param  button_press
/// @param  tex_col
/// @param  tex_press
function dks_button_add_colour(argument0, argument1, argument2, argument3, argument4, argument5) 
{
	argument0[argument1][@6] = argument2;
	argument0[argument1][@7] = argument3; 
	argument0[argument1][@8] = argument4;
	argument0[argument1][@9] = argument5; 
}