/// @description PointOnCubicBezier(4 points array,t)
/// @param 4 points array
/// @param t
function PointOnCubicBezier(argument0, argument1) 
{
 var ax, bx, cx, ay, by, cy, tSquared, tCubed,t;
	t = argument1;
	cx = 3 * (argument0[1][0] - argument0[0][0]);
	bx = 3 * (argument0[2][0] - argument0[1][0]) - cx;
	ax = argument0[3][0] - argument0[0][0] - cx - bx;

	cy = 3 * (argument0[1][1] - argument0[0][1]);
	by = 3 * (argument0[2][1] - argument0[1][1]) - cy;
	ay = argument0[3][1] - argument0[0][1] - cy - by;
 /* calculate the curve point at parameter value t */
 tSquared = t * t;
	tCubed = tSquared * t;
 var result;
	result[0] = ax * tCubed + bx * tSquared + cx * t + argument0[0][0];
	result[1] = ay * tCubed + by * tSquared + cy * t + argument0[0][1];
	return result;
}