/// @description dks_mat3_get_scale(matrix);
/// @param matrix
function dks_mat3_get_scale(argument0) 
{
	var a = argument0;
	var b;
	b[0] = sqrt(a[0][0] * a[0][0] + a[0][1] * a [0][1]);
	b[1] = sqrt(a[1][0] * a[1][0] + a[1][1] * a [1][1]);
	return b;
}