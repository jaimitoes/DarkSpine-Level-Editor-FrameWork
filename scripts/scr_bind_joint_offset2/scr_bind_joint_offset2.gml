function scr_bind_joint_offset2(argument0, argument1) 
{
	var xf = argument0;
	var yf = argument1;
	var tx = xf * mtx[0] +   -yf * mtx[1];
	var ty = -xf * mtx[4] +   yf * mtx[5];
	joint_list[| 0] = tx;
	joint_list[| 1] = ty;
}