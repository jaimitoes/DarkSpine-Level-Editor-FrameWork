/// @description dks_array_create_from_list(list);
/// @param list
function dks_array_create_from_list(argument0) 
{
	var l = argument0;
	var s = ds_list_size(l);
	var arr;
	for (var i=0;i<s;i++)
	{
	 arr[i] = l[| i];
	}
	return arr;
}