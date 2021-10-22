/// @description dks_input_list_transfer_list( list destiny, list source);
/// @param  list destiny
/// @param  list source
function dks_input_list_transfer_real(argument0, argument1) 
{
	var s = ds_list_size(argument1)
	{
	 for (var i =0; i<s; i++)
	 {
	  argument0[| i] = dks_input_get_text_real(argument1[| i]);
	 }
	}
}