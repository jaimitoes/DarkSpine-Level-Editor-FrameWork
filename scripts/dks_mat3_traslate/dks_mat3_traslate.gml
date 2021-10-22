/// @description dks_mat3_traslate(matrix,x,y)
/// @param matrix
/// @param x
/// @param y
function dks_mat3_traslate(argument0, argument1, argument2) 
{
	//return the matrix with traslate values
	var m;
 m[0][0]=1;    m[0][1]=0;    m[0][2]=argument1;
 m[1][0]=0;    m[1][1]=1;    m[1][2]=argument2;
 m[2][0]=0;    m[2][1]=0;    m[2][2]=1;
 dks_mat3_multiply(m,argument0);
	m=0;
}