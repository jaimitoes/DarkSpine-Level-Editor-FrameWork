/// @description dks_mat3_set_rotation_rad(matrix,angle);
/// @param matrix
/// @param angle
function dks_mat3_set_rotation_rad(argument0, argument1) 
{
	//set the rotation in radians;
	var m,c,s,degrees;
 degrees = argument1;
	c = cos(degtorad(degrees));
	s = sin(degtorad(degrees));
 m[0][0]=c;    m[0][1]=-s;   m[0][2]=0;
	m[1][0]=s;    m[1][1]=c;    m[1][2]=0;
	m[2][0]=0;    m[2][1]=0;    m[2][2]=1;
	dks_mat3_multiply(m,argument0);
	m=0;
}