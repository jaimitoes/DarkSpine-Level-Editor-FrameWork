function dks_tweener_manage_key_destroy() 
{
	if (target.have_tween)
	{
	 for (var i=0;i<10;i++)
	 {
	  var p_key_dest = point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),key_dest[i][0],key_dest[i][1],key_dest[i][2],key_dest[i][3]);
	  if (p_key_dest)
	  {
	   if (k_set[i]=1)
	   {
	    k_set[@i]=0;
	   }
	   if (target.tween[i] != -1)
	   {
	    TweenDestroy(target.tween[i]);
	    target.tween[@ i] = -1;
	   }
	  }
	 }
	 dks_tween_check(target);
	}      
}