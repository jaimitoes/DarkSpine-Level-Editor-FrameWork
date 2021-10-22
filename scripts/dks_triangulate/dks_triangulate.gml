/// @description dks_triangulate( list of points)
/// @param  list of points
function dks_triangulate(argument0) 
{
	// return triangle list
	var p = ds_list_create(),
	t = ds_list_create(),
	tr,
	in = 0,
	step = 0,
	dir,
	s,
	dir2,
	inter = 0;
	ds_list_copy(p,argument0);
	s = ds_list_size(p);
	while(s > 4)
	{
	 //
	 step +=1;
	 if(step>1000)/// is not compatible with holes so with this conditional you avoid a crash (delete this if you dont need)
	 {
	  break;
	 }
	 //
	 tr = true;
 
	 dir = point_direction(p[| (in) % s], p[| (in+1) % s],p[| (in+4) % s], p[| (in+5) % s]);
	 dir2 = point_direction(p[| (in) % s], p[| (in+1) % s],p[| (in+2) % s], p[| (in+3) % s]);
	 if(angle_difference(dir,dir2) > 0)
	 {
	  tr = false;
	 }
	 if (tr == true)
	 {
	  for(var j = 0; j < s*0.5; j++)
	  {
	   if (j >= ((in*0.5) % s) && j <= ((in*0.5+2) % s))
	   continue;
	   if (point_in_triangle(p[| 2*j], p[| 2*j+1],p[| (in) % s], p[| (in+1) % s],p[| (in+2) % s], p[| (in+3) % s],p[| (in+4) % s], p[| (in+5) % s]))
	   {
	    tr = false;
	    break;
	   }
	  }
	 }

	 if (tr == true)
	 {
	  ds_list_add(t, 
	  p[| (in) % s], p[| (in+1) % s],
	  p[| (in+2) % s], p[| (in+3) % s],
	  p[| (in+4) % s], p[| (in+5) % s]);
	  ds_list_delete(p, (in+2) % s);
	  ds_list_delete(p, (in+2) % (ds_list_size(p)+1));
  
	  s = ds_list_size(p);
	  inter = 0;
	 }
	 else
	 {
	  if (inter + 2 >= s)
	  {
	   break;
	  }
	  in = (in+2) % s;
	 }
	}
	ds_list_destroy(p);
	return t;
}