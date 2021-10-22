/// @description dks_mat3_set_rotation_deg(object,matrix,angle);
/// @param object
/// @param matrix
/// @param angle
function dks_mat3_set_rotation_deg(argument0, argument1) 
{
	//set the rotation in radians; Return array;
	var c,s,oc,z,degrees;
	var object = argument0;
	var m ;
	z =1;
	degrees = argument1;
 c = dcos(degrees);
	s = dsin(degrees);
	oc = 1.0 - c;
 m[0][0] = oc * object.x * object.x + c;  
 m[1][0] = oc * object.x * object.y - z* s;    
 m[2][0] = oc * z * object.x + object.y * s;     
 m[0][1] = oc * object.x * object.y + z * s;
 m[1][1] = oc * object.y * object.y + c;  
 m[2][1] = oc * object.y * z - object.x * s; 
 m[0][2] = oc * z  * object.x -object.y *s;
 m[1][2] = oc * object.y * z + object.x * s;
 m[2][2] = oc * z * z + c;
 return m;
}