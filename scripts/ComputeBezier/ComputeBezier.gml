/// @description ComputeBezier(list to add, 4 points_array, numberOfPoints) 
/// @param list to add
/// @param  4 points_array
/// @param  numberOfPoints
function ComputeBezier(argument0, argument1, argument2) 
{
	/*
	 ComputeBezier fills an array of Point2D structs with the curve   
	 points generated from the control points cp. Caller must 
	 allocate sufficient memory for the result, which is 
	 <sizeof(Point2D) numberOfPoints>
	*/
	var s = argument2, dt, point, i;
	dt = 1.0 / ( s - 1 );
	for( i = 0; i < s; i++)
	{
	 point = PointOnCubicBezier( argument1, i*dt );
	 ds_list_add(argument0,point[0],point[1]);
	}
}