/// @description dks_mat3_get_determinant(matrix)
/// @param matrix
function dks_mat3_get_determinant(argument0) 
{
	// return the determinant of a matrix;
	var m = argument0;
	return m[0][0]* m[1][1]*m[2][2] + m[0][1]*m[1][2]*m[2,0] + m[0][2]*m[1,0]*m[2][1] - m[0,0]*m[1][2]*m[2,1] - m[0][1]*m[1,0]*m[2][2] - m[0][2]*m[1][1]*m[2][0]; 
}