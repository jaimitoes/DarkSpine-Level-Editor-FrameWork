/// @description dks_mat3_multiply(matrix to add,orginal matrix)
/// @param matrix to add
/// @param orginal matrix
function dks_mat3_multiply(argument0, argument1) 
{
	var c = argument0;
	var product, sum;
	for (var i=0; i<3; i++)
	{
	 for (var j=0; j<3; j++)
	 {
	  sum = 0;
	  for (var z=0; z<3; z++)
	  sum += c[i][z] * argument1[z][j];
	  product[i][j] = sum;
	 }
	} 
	dks_mat3_copy(argument1, product);
	product =0;
}