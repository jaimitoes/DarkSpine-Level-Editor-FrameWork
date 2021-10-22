/// @description dks_cord_vertex_to_screen(x, y, z, viewmat, projmat, camWidth, camHeight)
/// @param x
/// @param y
/// @param z
/// @param viewmat
/// @param projmat
/// @param camWidht
/// @param camHeight
function dks_cord_vertex_to_screen(argument0, argument1, argument2, argument3, argument4, argument5, argument6) 
{
	var X = argument0,
	Y = argument1,
	Z = argument2,
	V = argument3,
	P = argument4,
	W = argument5,
	H = argument6,
	A = V[2] * X + V[6] * Y + V[10] * Z + V[14],
	xx, yy;

	if A <= 0
	{
	 return [-1, -1];
	}

	if (P[15] == 0)
	{    
	 xx = P[8] + P[0] * (V[0] * X + V[4] * Y + V[8] * Z + V[12]) / A;
	 yy = P[9] + P[5] * (V[1] * X + V[5] * Y + V[9] * Z + V[13]) / A;
	}
	else
	{    
	 xx = P[12] + P[0] * (V[0] * X + V[4] * Y + V[8]  * Z + V[12]);
	 yy = P[13] + P[5] * (V[1] * X + V[5] * Y + V[9]  * Z + V[13]);
	}
	return [ W*(.5 + .5 * xx), H*( .5 - .5 * yy)];
}