/// @description dks_mat3_invert(matrix)
/// @param matrix
function dks_mat3_invert(argument0) 
{
	var m = argument0;
	var m2;
	/** Inverts this matrix given that the determinant is != 0.
	 * @return This matrix for the purpose of chaining operations.
	 * @throws GdxRuntimeException if the matrix is singular (not invertible) */
	det = dks_mat3_get_determinant(m);
 if (det == 0)
	{
	 dks_message("No es invertible");
	 exit;
	}
	var inv_det = 1.0/ det;
	var tmp;
 tmp[0][0] = m[1][1] * m[2][2] - m[2][1] * m[1][2];
	tmp[1][0] = m[2][0] * m[1][2] - m[1][0] * m[2][2];
	tmp[2][0] = m[1][0] * m[2][1] - m[2][0] * m[1][1];
	tmp[0][1] = m[2][1] * m[0][2] - m[0][1] * m[2][2];
	tmp[1][1] = m[0][0] * m[2][2] - m[2][0] * m[0][2];
	tmp[2][1] = m[2][0] * m[0][1] - m[0][0] * m[2][1];
	tmp[0][2] = m[0][1] * m[1][2] - m[1][1] * m[0][2];
	tmp[1][2] = m[1][0] * m[0][2] - m[0][0] * m[1][2];
	tmp[2][2] = m[0][0] * m[1][1] - m[1][0] * m[0][1];
 m2[0][0] = inv_det * tmp[0][0];
	m2[1][0] = inv_det * tmp[1][0];
	m2[2][0] = inv_det * tmp[2][0];
	m2[0][1] = inv_det * tmp[0][1];
	m2[1][1] = inv_det * tmp[1][1];
	m2[2][1] = inv_det * tmp[2][1];
	m2[0][2] = inv_det * tmp[0][2];
	m2[1][2] = inv_det * tmp[1][2];
	m2[2][2] = inv_det * tmp[2][2];
 return m2;
}