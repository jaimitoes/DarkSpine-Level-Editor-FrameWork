/// @description dks_mat3_reset(matrix);
/// @param matrix
function dks_mat3_reset(argument0) 
{
	argument0[0][@0]=1; argument0[0][@1]=0; argument0[0][@2]=0; 
	argument0[1][@0]=0; argument0[1][@1]=1; argument0[1][@2]=0;
	argument0[2][@0]=0; argument0[2][@1]=0; argument0[2][@2]=1;
}