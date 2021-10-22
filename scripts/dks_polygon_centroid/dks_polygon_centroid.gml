/// @description dks_polygon_centroid(poly list)
/// @param poly list
function dks_polygon_centroid(argument0) 
{
	var ax, ay,l, n,s;
	l = argument0;
	s = ds_list_size(l);
	n = 0;

	for(i =0; i<s; i+=2)
	{
	 ax[n] = l[| i];
	 ay[n] = l[| i+1];
	 n+=1;
	}
	var len = array_length(ax);
	var firstx = ax[0], firsty = ay[0], lastx = ax[len-1], lasty = ay[len-1];
	if (firstx != lastx || firsty != lasty)
	{
	 ax[len] = ax[0];
	 ay[len] = ay[0];
	}
 var twicearea=0, X=0, Y=0, nPts = array_length(ax), f;
	for ( var i=0, j=nPts-1 ; i<nPts ; j=i++ ) 
	{
	   p1x = ax[i];
	   p1y = ay[i];
	   p2x = ax[j];
	   p2y = ay[j];
	   f = (p1y - firsty) * (p2x - firstx) - (p2y - firsty) * (p1x - firstx);
	   twicearea += f;
	   X += (p1x + p2x - 2 * firstx) * f;
	   Y += (p1y + p2y - 2 * firsty) * f;
	}
	f = twicearea * 3;
	var a;
	a[0] = X/f + firstx;
	a[1] = Y/f + firsty;
	return a;
}