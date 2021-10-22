function dks_tween_play_all() 
{
	with (obj_deco)
	{
	 if (have_tween)
	 {
	  TweenPlay(TweensTarget(id));
	 }
	}
}