/// @description dks_normalize_vector(x,y,z)
/// @param x
/// @param y
/// @param z
function dks_normalize_vector(argument0, argument1, argument2) 
{
	var a,len;
	a[0] = argument0;//X
	a[1] = argument1;//Y
	a[2] = argument2;//Z
	len = sqrt(a[0]*a[0] + a[1]*a[1] + a[2]*a[2]);
	if(len != 0.)
	{
	 a[0] /= len;
	 a[1] /= len;
	 a[2] /= len;
	}
	return a;
}