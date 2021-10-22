/// @description dks_input_set_text(id, str)
/// @param id
/// @param  str
function dks_input_set_text(argument0, argument1) 
{
	argument0.text = argument1;
	ds_stack_push(argument0.history0, argument0.text);
	ds_stack_clear(argument0.history1);
}