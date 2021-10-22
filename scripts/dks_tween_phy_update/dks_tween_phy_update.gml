function dks_tween_phy_update(argument0) 
{
	with(argument0)
	{
  var s = array_length(tween);
	 for(var i =0; i<s; i++)
	 {
	  if TweenExists(tween[i])
	  {
	   switch(i)
	   {
     case 0: 
     TweenSet(tween[0],"property", phyx__);
	    var st = TweenGet(tween[0],"start");
	    var dt = TweenGet(tween[0],"destination");
	    TweenSet(tween[0], "start", st + col_xoff);
	    TweenSet(tween[0], "destination", dt + col_xoff);
     break;
	    case 1: 
	    TweenSet(tween[1],"property", phyy__);
	    var st = TweenGet(tween[1],"start");
	    var dt = TweenGet(tween[1],"destination");
	    TweenSet(tween[1], "start", st + col_yoff);
	    TweenSet(tween[1], "destination", dt + col_yoff);
     break;
     case 4: 
	    TweenSet(tween[4],"property", phyr__);
	    break;
	   }
	  }
	 }
	}  
}