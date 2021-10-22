/// @description dks_input_list_get_text(input list);
/// @param input list
function dks_input_list_get_text(argument0) 
{
	var t;
	var s = ds_list_size(argument0);
	for(var i = 0;i<s;i++)
	{
	 t[i] = dks_input_get_text(argument0[| i]);
	}
	return t;
}