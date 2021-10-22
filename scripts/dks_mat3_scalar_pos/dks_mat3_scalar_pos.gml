/// @description dks_mat3_scalar_pos(x,y);
/// @param x
/// @param y
/** Scale this matrix using the x and y components of the vector but leave the rest of the matrix alone.
	 * @param scale The {@link Vector3} to use to scale this matrix.
	 * @return This matrix for the purpose of chaining methods together. */
function dks_mat3_scalar_pos(argument0, argument1) 
{
	mtx[0][@0] *= argument0;
	mtx[1][@1] *= argument1;
}