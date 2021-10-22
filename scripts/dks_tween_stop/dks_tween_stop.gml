function dks_tween_stop(argument0) 
{
	with (argument0)
	{
	 if is_array(tween)
	 {
	  TweenStop(TweensTarget(id));
	  dks_tweener_tween_reset(id);
	 }
	}
}