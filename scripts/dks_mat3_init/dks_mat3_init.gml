/// @description dkd_mat3_init
/// return a default matrix
function dks_mat3_init() 
{
	var m;
	m[0][0] = 1; m[ 0][1] = 0; m[ 0][2] = 0; 
	m[1][0] = 0; m[ 1][1] = 1; m[ 1][2] = 0;
	m[2][0] = 0; m[ 2][1] = 0; m[ 2][2] = 1;
	return m;
}