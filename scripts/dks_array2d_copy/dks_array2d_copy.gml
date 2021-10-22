/// @description dks_array2d_copy
/// @param array
function dks_array2d_copy(argument0) 
{
	var a = argument0, sh = array_length(a), sl, n;
	for(var i =0; i<sh;i++)
	{
	 sl = array_length(a[i]);
	 for (var j=0;j<sl;j++)
	 {
	  n[i][j] = a[i][j];
	 }
	}
	return n;
}