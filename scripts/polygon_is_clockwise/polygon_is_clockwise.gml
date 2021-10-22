/// @description polygon_is_clockwise(polygon list)
/// @param polygon list
function polygon_is_clockwise(argument0) 
{
	var polygon, size, sum, i;
	polygon = argument0;
	size = ds_list_size(polygon);
	sum = 0;
	for (i=0; i<size-2; i+=2) 
	{
	  sum += (polygon[| i+2]-polygon[| i])*(polygon[| i+3]+polygon[| i+1]);
	}
	sum += (polygon[| 0]-polygon[| size-2])*(polygon[| 1]+polygon[| size-1]);
	return sum<0;
}