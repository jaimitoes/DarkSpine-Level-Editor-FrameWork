/// @description dks_mat3_get_rotation_deg();
function dks_mat3_get_rotation_deg(argument0) 
{
	// Return the rotation matrix value;
	return radtodeg(arctan2(argument0.mtx[1][0],argument0.mtx[0][0]));
}