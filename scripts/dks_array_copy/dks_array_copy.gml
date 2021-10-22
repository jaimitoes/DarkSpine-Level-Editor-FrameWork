/// @description dks_array_copy(array)
/// @param array
function dks_array_copy(argument0) 
{
	var a, c = argument0, s = array_length(c);
	for(var i =0; i<s; i++)
	{
	 a[i] = c[i];
	}
	return a;
}