/// @description dks_in_rectangle(x,y,x1,y1,x2,y2);
/// @param x
/// @param y
/// @param x1
/// @param y1
/// @param x2
/// @param y2
function dks_in_rectangle(argument0, argument1, argument2, argument3, argument4, argument5) 
{
	//This one can check inverse coordinates
	var mx,my,x1,y1,x2,y2,t,
	mx = argument0,
	my = argument1,
	x1 = argument2,
	y1 = argument3,
	x2 = argument4,
	y2 = argument5,
	t = false;
	 if (x1<x2)
	 {
	  if(y1<y2)
	  {
	    t = point_in_rectangle(mx,my,x1,y1,x2,y2);
	  }
	  else
	  {
	    t = point_in_rectangle(mx,my,x1,y2,x2,y1);
	  }
	 }
	 else
	 {
	  if(y1<y2)
	  {
	   t = point_in_rectangle(mx,my,x2,y1,x1,y2);
	  }
	  else
	  {
	   t = point_in_rectangle(mx,my,x2,y2,x1,y1);
	  }
	 }

	return t;
}