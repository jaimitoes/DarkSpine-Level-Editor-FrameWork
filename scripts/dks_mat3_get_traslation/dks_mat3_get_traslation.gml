/// @description dks_mat3_get_traslation(matrix)
/// @param matrix
function dks_mat3_get_traslation(argument0) 
{
	var a;
	a[0] = argument0[0][2];
	a[1] = argument0[1][2];
	return a;
}