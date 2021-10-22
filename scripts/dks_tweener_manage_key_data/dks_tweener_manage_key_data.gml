function dks_tweener_manage_key_data() 
{
	var press = dks_button_press(key_get);
	if (press > -1)
	{
	 if  (!can_play)
	 {
	  TweenStop(TweensTarget(target));
	  dks_tweener_tween_reset(target);
	  can_play=1;
	 }
	 switch(press)
	 {
	  case 0 : 
	  dks_tweener_insert_tweens(target);
	  dks_message("Animation data inserted");
	  break;
	  case 1 : dks_tweener_get_data(target);
	  break;
	 }
 }
}