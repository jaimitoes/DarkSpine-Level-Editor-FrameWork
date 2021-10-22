/// @description dks_list_create_from_map(map value)
/// @param map value
function dks_list_create_from_map(argument0) 
{
	var l = ds_list_create();
	ds_list_copy(l,argument0);
	return l;
}