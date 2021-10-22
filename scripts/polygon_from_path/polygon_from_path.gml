function polygon_from_path(argument0) 
{
	var path, polygon, n;
 path = argument0;
	polygon = ds_list_create();
	n = path_get_number(path);
	for (i=0; i<n; i+=1) 
	{
	  ds_list_add(polygon, path_get_point_x(path, i));
	  ds_list_add(polygon, path_get_point_y(path, i));
	}
 return polygon;
}