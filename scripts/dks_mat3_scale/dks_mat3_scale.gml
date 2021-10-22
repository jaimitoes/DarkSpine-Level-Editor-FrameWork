/// @description dks_mat3_scale(matrix, xscale,yscale)
/// @param matrix
/// @param  xscale
/// @param yscale
function dks_mat3_scale(argument0, argument1, argument2) 
{
	//Retrun matrix with scale values
	var m;
	m[0][0]=argument1;    m[0][1]=0;    m[0][2]=0;
	m[1][0]=0;    m[1][1]=argument2;    m[1][2]=0;
	m[2][0]=0;            m[2][1]=0;    m[2][2]=1;
	dks_mat3_multiply(m,argument0);
	m =0;
}