/// @description dks_polygon_area (poly_list)
/// @param poly_list
function dks_polygon_area(argument0) 
{
	var ax, ay,l, n,s,area,j,as,i;
	l = argument0;
	s = ds_list_size(l);
	n = 0;

	for(i =0; i<s; i+=2)
	{
	 ax[n] = l[| i];
	 ay[n] = l[| i+1];
	 n+=1;
	}
 
	// Initialze area 
	area = 0; 
	as = array_length(ax);
	// Calculate value of shoelace formula 
	j = as - 1; 
	for (i = 0; i < as; i++) 
	{ 
	 area += (ax[j] + ax[i]) * (ay[j] - ay[i]); 
	 j = i;  // j is previous vertex to i 
	} 
	// Return absolute value 
	return abs(area / 2.0); 
}