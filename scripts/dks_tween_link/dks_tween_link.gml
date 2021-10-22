function dks_tween_link(argument0, argument1) 
{
	var s = array_length(child);
	for(var i =0; i<s; i++)
	{
	 with(child[i])
	 {
	  have_tween = 0;
	  if is_array(tween)
	  {
	   var tl= array_length(tween);
	   for(var j =0; j<tl;j++)
	   {
	    if (TweenExists(tween[j]))
	    {
	     TweenSet(tween[j],"target",argument1);
	     if TweenExists(argument0.tween[j])
	     {
	      TweenAddCallback(argument0.tween[j],TWEEN_EV_FINISH,argument1,TweenPlay,tween[j]);
	     }
	     else
	     {
	      TweenPlay(tween[j]);
	     }
	    }
	   }
	  }
	  if (parent)
	  {
	   dks_tween_link(id,argument1);
	  }
	 }
	}
}