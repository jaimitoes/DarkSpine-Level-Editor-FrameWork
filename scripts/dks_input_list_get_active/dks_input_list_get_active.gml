/// @description dks_input_list_get_active(list);
/// @param list
function dks_input_list_get_active(argument0) 
{
	var l = argument0;
	var s = ds_list_size(l);
	for( var i = 0; i<s;i++)
	{
	 if dks_input_get_active(l[|i])
	 {
	  return true;exit;
	 }
	}
	return false;
}