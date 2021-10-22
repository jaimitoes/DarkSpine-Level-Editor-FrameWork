/// @description dks_array2d_length_copy(array2D, index)
/// @param array
/// @param index
function dks_array2d_length_copy(argument0, argument1) 
{
	var a = argument0;
	var s = array_length(a[argument1]), n = 0;
	for(var i =0; i<s;i++)
	{
	 n[i] = a[argument1][i];
	}
	return n;
}