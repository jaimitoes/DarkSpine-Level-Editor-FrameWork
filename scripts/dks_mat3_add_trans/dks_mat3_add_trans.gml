/// @description dks_mat3_add_trans(matrix,x,y)
/// @param matrix
/// @param x
/// @param y
function dks_mat3_add_trans(argument0, argument1, argument2) 
{
	/** Adds a translational component to the matrix in the 3rd column. The other.id columns are untouched.
	 * @param vector The translation vector.
	 * @return This matrix for the purpose of chaining. */
	var m = argument0;
	m[0][@2] += argument1;
	m[1][@2] += argument2;
}