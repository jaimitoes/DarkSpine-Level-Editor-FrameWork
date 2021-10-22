/// @description  point_in_poly(x,y,array)
/// @param x
/// @param y
/// @param array
function dks_point_in_polygon(argument0, argument1, argument2) 
{
	var x0, y0, pg, in, n, i, px, py, x1, y1, x2, y2;
	x0 = argument0;
	y0 = argument1;
	pg = argument2;
	in = false;
	n = array_length(pg) div 2;
	for (i=0; i<n; i+=1)
	{
	 px[i] = pg[2*i];
	 py[i] = pg[2*i+1];
	}
	px[n] = px[0];
	py[n] = py[0];
	for (i=0; i<n; i+=1)
	{
	 x1 = px[i];
	 y1 = py[i];
	 x2 = px[i+1];
	 y2 = py[i+1];
	 if ((y2 > y0) != (y1 > y0)) 
	 {
	  in ^= (x0 < (x1-x2) * (y0-y2) / (y1-y2) + x2);
	 }       
	}
	return in;
}