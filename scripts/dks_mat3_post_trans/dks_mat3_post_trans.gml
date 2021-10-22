/// @description scr_matrix_post_trans(matrix,x,y)
/// @param matrix
/// @param x
/// @param y
function dks_mat3_post_trans(argument0, argument1, argument2) 
{

	/** Postmultiplies this matrix by a translation matrix. Postmultiplication is also used by OpenGL ES' 1.x
	 * glTranslate/glRotate/glScale.
	 * @param x The x-component of the translation vector.
	 * @param y The y-component of the translation vector.
	 * @return This matrix for the purpose of chaining. */
	var m,tmp;
	tmp[0][0] = 1;
	tmp[1][0] = 0;
	tmp[2][0] = 0;

	tmp[0][1] = 0;
	tmp[1][1] = 1;
	tmp[2][1] = 0;

	tmp[0][2] = argument1;
	tmp[1][2] = argument2;
	tmp[2][2] = 1;
	m = dks_mat3_multiply(argument0, tmp);
	return m;
}