/// @description ds_list_create_from_array(array);
/// @param array
function ds_list_create_from_array(argument0) 
{
 var s = array_length(argument0),
 l = ds_list_create();
 for(var i =0; i<s; i++)
 {
  l[| i] = argument0[i];
 }
 return l;
}