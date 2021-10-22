/// @description dks_normalize_distance(x1, y1, x2, y2)
/// @param x1
/// @param  y1
/// @param  x2
/// @param  y2
function dks_normalize_distance(argument0, argument1, argument2, argument3) 
{
	var x1,y1,x2,y2,dx,dy;
	x1 = argument0;
	y1 = argument1;
	x2 = argument2;
	y2 = argument3;
	dx = abs(x1-x2);
	dy = abs(y1-y2);
	return sqrt(dx + dy);
}