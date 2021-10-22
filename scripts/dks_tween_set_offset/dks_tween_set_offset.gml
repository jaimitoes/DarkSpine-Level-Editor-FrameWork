/// @description dks_set_offset()
function dks_tween_set_offset(argument0) 
{
	with(argument0)
	{
	 if (have_tween)
	 {
		 var s = array_length(tween);
		 for (var i =0; i<s; i++)
		 {
		  if (tween[i] !=-1)
		  {
		   var st = TweenGet(tween[i],"start");
		   var dt = TweenGet(tween[i],"destination");
		   switch(i)
		   {
		    case 0 : 
		    TweenSet(tween[0],"start", st + (x -xstart));
		    TweenSet(tween[0],"destination", dt + (x-xstart));
		    break;
		    case 1 :
		    TweenSet(tween[1],"start", st + (y -ystart));
		    TweenSet(tween[1],"destination", dt + (y -ystart));
		    break;
		    case 2 :
		    TweenSet(tween[2],"start",st + (image_xscale -xsoffset));
		    TweenSet(tween[2],"destination", dt + (image_xscale -xsoffset));
		    case 3 :
		    TweenSet(tween[3],"start",st + (image_yscale-ysoffset));
		    TweenSet(tween[3],"destination", dt + (image_yscale-ysoffset));
		    break;
		    case 4 :
		    TweenSet(tween[4],"start",st + (image_angle -anoff));
		    TweenSet(tween[4],"destination", dt + (image_angle -anoff));
		    break;
		    case 5 :
		    TweenSet(tween[5],"start",st + (image_alpha - aloff));
		    TweenSet(tween[5],"destination", dt + (image_alpha - aloff));
		    break;
       
		    case 7 :
		    TweenSet(tween[7],"start", st + (depth-zoff));
		    TweenSet(tween[7],"destination", dt + (depth-zoff));
		    break;
		    case 8 :
		    TweenSet(tween[8],"start", st + (x_rotation-anoffx));
		    TweenSet(tween[8],"destination", dt + (x_rotation-anoffx));
		    break;
		    case 9 :
		    TweenSet(tween[9],"start", st + (y_rotation-anoffy));
		    TweenSet(tween[9],"destination", dt + (y_rotation-anoffy));
		    break;
     }
	   }
	  }
  }
	 if (parent)
	 {
	  var s = array_length(child);
	  for(var i =0; i<s; i++)
	  {
	   with(child[i])
	   {
	    dks_tween_set_offset(id);
	   }
	  }
	 }   
	}
}