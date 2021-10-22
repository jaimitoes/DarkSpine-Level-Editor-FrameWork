function scr_bind_joint_offset4(argument0, argument1, argument2, argument3) 
{
	var xf = argument0;
	var yf = argument1;
	var xf2 = argument2;
	var yf2 = argument3;
	var tx =  xf * mtx[0] +  -yf * mtx[1];
	var ty = -xf * mtx[4] +   yf * mtx[5];
	var tx2 = xf2 * mtx[0] + -yf2 * mtx[1];
	var ty2 = -xf2 * mtx[4] + yf2 * mtx[5];
	joint_list[| 0] = tx;
	joint_list[| 1] = ty;
	joint_list[| 2] = tx2;
	joint_list[| 3] = ty2;
}