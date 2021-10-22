/// @description dks_input_list_set_text(input_list,string from list or array);
/// @param input_list
/// @param string from list or array
function dks_input_list_set_text(argument0, argument1) 
{
	var size = ds_list_size(argument0);
	if is_array(argument1)
	{
 
	 for(var i = 0;i<size;i++)
	 {
	  dks_input_set_text(input_list[| i],string(argument1[ i]));
	 }
	}
	else
	{
	 for(var i = 0;i<size;i++)
	 {
	  dks_input_set_text(input_list[| i],string(argument1[| i]));
	 }
	}
}