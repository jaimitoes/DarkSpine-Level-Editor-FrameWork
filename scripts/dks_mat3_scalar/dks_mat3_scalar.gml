function dks_mat3_scalar(argument0) 
{
	//dks_mat3_scalar(scale_factor)
	/** Scale the matrix in the both the x and y components by the scalar value.
	 * @param scale The single value that will be used to scale both the x and y components.
	 * @return This matrix for the purpose of chaining methods together. */
	mtx[0][0] *=argument0;
	mtx[1][1] *=argument0;
}