/// @description ds_list_create_from_array2d(array2D);
/// @param array2D
function ds_list_create_from_array2d(argument0) 
{
	var arr = argument0,
	sh = array_length(arr),
	l = ds_list_create(),sl;
	for(var i =0; i<sh;i++)
	{
	 sl = array_length(arr[i]);
	 for (var j=0;j<sl;j++)
	 {
	  ds_list_add(l,arr[i][j]);
	 }
	}
	return l;
}