/// @description dks_mat3_substract(matrix1,matrix2)
/// @param matrix1
/// @param matrix2
function dks_mat3_substract(argument0, argument1) 
{
	var m1 =argument0;
	var m2 =argument1;
	var product ;
	for (var i=0; i<3; i++)
	for (var j=0; j<3; j++)
	{
	 product[i][j] = m1[i][j]- m2[i][j];
	}
	return product;
}