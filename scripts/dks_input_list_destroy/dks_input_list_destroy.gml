/// @description dks_input_list_destroy( list_id)
/// @param list_id
function dks_input_list_destroy(argument0) 
{
	var l = argument0;
	if ds_exists(l, ds_type_list)
	{
	 var s = ds_list_size(l);
	 for (var i = 0; i<s; i++)
	 {
	   instance_destroy(l[| i]);	 
	 }
	 ds_list_destroy(l);
	}
}