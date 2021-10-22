/// @description dks_mat3_traspose(matrix);
/// @param matrix
function dks_mat3_traspose(argument0) 
{
	/** Transposes the current matrix.
	 * @return This matrix for the purpose of chaining methods together. */

	// Where MXY you do not have to change MXX
	var val = argument0;
	var m;
	var v01 = val[1][0];
	var v02 = val[2][0];
	var v10 = val[0][1];
	var v12 = val[2][1];
	var v20 = val[0][2];
	var v21 = val[1][2];
	m[ 0][1] = v01;
	m[ 0][2] = v02;
	m[ 1][0] = v10;
	m[ 1][2] = v12;
	m[ 2][0] = v20;
	m[ 2][1] = v21;
	return m;
}