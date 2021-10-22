function dks_spawn_text(argument0) 
{
 with instance_create_depth(-100000,-100000,0,obj_spawn_text)
	{
	 current_font = font_OverThere;
	 previous_font =fontGGUI;
	 text = argument0[0];
	 _3d = 0;
	 draw_method = dks_draw_text;
	 object_transform = object_get_name(object_index);
	 object_execute = 1;
	 tweenText = TweenCreate(id, asset_get_index(argument0[1]), TWEEN_MODE_BOUNCE,1, real(argument0[2]), real(argument0[3]),
	 "x", real(argument0[4]), real(argument0[5]),
	 "y", real(argument0[6]), real(argument0[7]),
	 "depth",real(argument0[8]), real(argument0[9]),
	 "image_xscale",real(argument0[10]), real(argument0[11]),
	 "image_yscale",real(argument0[12]), real(argument0[13]));
	 TweenAddCallback(tweenText,TWEEN_EV_CONTINUE,id, TweenPause, tweenText);
	 TweenAddCallback(tweenText,TWEEN_EV_CONTINUE,id, dks_alarm_set, 0, 100);
	 TweenAddCallback(tweenText,TWEEN_EV_FINISH, id, dks_instance_destroy, id);
	 TweenPlay(tweenText);
	}
}