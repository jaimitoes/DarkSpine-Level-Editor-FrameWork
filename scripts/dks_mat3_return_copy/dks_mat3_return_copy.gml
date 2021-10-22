/// @description dks_mat3_return_copy(source);
/// @param source
function dks_mat3_return_copy(argument0) 
{
	// Same as "dks_mat3_copy" but this one return the array;
 var dst;
	var src = argument0;
 for (var i=0; i<3; i++)
	{
	 for (var j=0; j<3; j++) 
	 {
	  dst[i][j] = src[i][j];
	 } 
	}  
	return dst;
}