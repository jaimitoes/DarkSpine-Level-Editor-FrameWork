/// @description dks_mat3_get_rotation_rad(matrix);
/// @param matrix
function dks_mat3_get_rotation_rad(argument0) 
{
	// Return the rotation matrix value based of the rotation matrix;
	return arctan2(argument0[1][0],argument0[0][0]);
}