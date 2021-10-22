/// @description  polygon_is_convex(polygon)
/// @param polygon
function polygon_is_convex(argument0) 
{
	//
	//  Returns true if a given 2D polygon is convex, false other.idwise.
	//
	//      polygon     ds_list of an ordered series of coordinate
	//                  pairs defining the shape of a polygon
	//
	//  Polygon vertices can be given in clockwise or counter-clockwise order.
	//  Polygons are closed figures with edges spanning consecutive vertices
	//  and from the last vertex to the first. Polygons must be simple, which
	//  means they cannot have edges that cross one another.
	//
	//  eg. square polygon = { 100,100,  100,200,  200,200,  200,100 }
	//
	/// GMLscripts.com/license
 var zp = false;
 var polygon = argument0;
	var size = ds_list_size(polygon);
	for (var i=0; i<size; i+=2) 
	{
		var j = (i+2) mod size;
		var k = (i+4) mod size;
	 var x0 = ds_list_find_value(polygon, i);
		var y0 = ds_list_find_value(polygon, i+1);
		var x1 = ds_list_find_value(polygon, j);
		var y1 = ds_list_find_value(polygon, j+1);
		var x2 = ds_list_find_value(polygon, k);
		var y2 = ds_list_find_value(polygon, k+1);
	 var z = (x1-x0) * (y2-y1) - (y1-y0) * (x2-x1);
	 if (z >= 0)
		{
		  zp = true;
		}  
		else if (z < 0)
		{
		  return false;
		}
 }
 return true;
}