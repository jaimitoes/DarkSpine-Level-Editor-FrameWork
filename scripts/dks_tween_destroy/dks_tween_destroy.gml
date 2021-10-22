function dks_tween_destroy() 
{
	if (have_tween)
	{
 
	 for (var i = 0; i<array_length(tween); i++)
	 {
	  if TweenExists(tween[i])
	  {
	   TweenDestroy(tween[i]);
	  }
	 }
	}
}