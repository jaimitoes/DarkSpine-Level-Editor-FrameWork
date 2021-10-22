/// @description ds_list_reverse(list)
/// @param list
function ds_list_reverse(argument0) 
{
 var list = argument0;
	var list_sorted = ds_list_create();
	var size = ds_list_size(list)-1;

	for (var i=size; i>0; i-=2)
	{
	 ds_list_add(list_sorted, list[| i-1]);
	 ds_list_add(list_sorted, list[| i]);
 }

	ds_list_clear(list);
	ds_list_copy(list, list_sorted);
	ds_list_destroy(list_sorted); 
}