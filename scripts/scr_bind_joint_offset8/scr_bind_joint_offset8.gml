function scr_bind_joint_offset8(argument0, argument1, argument2, argument3) 
{
	with(joint_target)
	{
	 dks_matrix_update();
	}
	var mtp = joint_target.mtx;
	var xf = argument0,
	yf = argument1,
	xf2 = argument2,
	yf2 = argument3,
	tx = xf * mtx[0] +   -yf * mtx[1],
	ty = -xf * mtx[4] +   yf * mtx[5],
	tx2 = xf2 * mtp[0] +   -yf2 * mtp[1],
	ty2 = -xf2 * mtp[4] +   yf2 * mtp[5];
	joint_list[| 4] = tx;
	joint_list[| 5] = ty;
	joint_list[| 6] = tx2;
	joint_list[| 7] = ty2;
}