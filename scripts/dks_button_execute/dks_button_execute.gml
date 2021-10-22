/// @description dks_button_execute(button_array,input number)
/// @param button_array
/// @param input number
function dks_button_execute(argument0, argument1) 
{
	last_input = argument1;//used to save the last button pressed and profit to use in the script.
	script_execute(argument0[last_input][11]);
}