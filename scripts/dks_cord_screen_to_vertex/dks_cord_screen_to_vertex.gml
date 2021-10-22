/// @description dks_cord_screen_to_vertex
/// @param x
/// @param y
/// @param viewMat
/// @param ProjMat
/// @param windowW
/// @param windowH
function dks_cord_screen_to_vertex(argument0, argument1, argument2, argument3, argument4, argument5)
{
	/*
	Transforms a 2D coordinate (in window space) to a 3D vector.
	Returns an array of the following format:
	[dx, dy, dz, ox, oy, oz]
	where [dx, dy, dz] is the direction vector and [ox, oy, oz] is the origin of the ray.
	Works for both orthographic and perspective projections.
	Script created by TheSnidr
	*/
	var _x = argument0,
	_y = argument1,
	V = argument2,
	P = argument3,
	W = argument4,
	H = argument5;
	var mx = 2 * (_x / W - .5) / P[0];
	var my = 2 * (_y / H - .5) / P[5];

	var camX =  -(V[12] * V[0] + V[13] * V[1] + V[14] * V[2]);
	var camY =  -(V[12] * V[4] + V[13] * V[5] + V[14] * V[6]);
	var camZ =  -(V[12] * V[8] + V[13] * V[9] + V[14] * V[10]);
	if (P[15] == 0)
	{    
		//This is a perspective projection
  return [V[2]  + mx * V[0] + my * V[1], V[6]  + mx * V[4] + my * V[5], V[10] + mx * V[8] + my * V[9], camX, camY, camZ];
	}
	else
	{    //This is an ortho projection
	 return [V[2], V[6], V[10], camX + mx * V[0] + my * V[1], camY + mx * V[4] + my * V[5], camZ + mx * V[8] + my * V[9]];
	}
}