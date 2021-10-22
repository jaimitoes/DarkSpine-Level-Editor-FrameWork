/// @description dks_mat3_copy(destiny,source);
/// @param destiny
/// @param source
function dks_mat3_copy(argument0, argument1) 
{
	var dst = argument0;//original matrix
	var src = argument1;
	for (var i=0; i<3; i++)
	{
	 for (var j=0; j<3; j++) 
	 {
	  dst[i][@j] = src[i][j];
	 } 
	}  
	src=0;   
}