function dks_tween_check(argument0) 
{
	var object = argument0;
	with(object)
	{
	 if is_array(tween)
	 {
	  for (var i =0; i<10;i++)
	  {
	   if (tween[i] != -1)
	   {
	    exit;
	   }
	  }
	 }
 
	have_tween =0;
	tween = 0;
	}
}