/// @description dks_mat3_copy_affine(matrix)
/// @param matrix
function dks_mat3_copy_affine(argument0) 
{
	// return a copy of the affined matrix;
	var m1,m2;
	m1 = argument0;
	m2[0][0] = m1[0][0];
	m2[1][0] = m1[1][0];
	m2[2][0] = 0;
	m2[0][1] = m1[0][1];
	m2[1][1] = m1[1][1];
	m2[2][1] = 0;
	m2[0][2] = m1[0][2];
	m2[1][2] = m1[1][2];
	m2[2][2] = 1;
	return m2;
}