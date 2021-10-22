/// @description dks_message(string);
/// @param string
function dks_message(argument0) 
{
	var w = window_get_width();
	if (instance_exists(obj_msn))
	{
	 with (instance_create_depth(0,0,0,obj_msn))
	 {
	  var num = instance_number(obj_msn);
	  var inst = instance_find(obj_msn,num-2);
   show_text = argument0;
	  start_x =   w;
	  start_y =   64+(inst.start_y-16);
	  dest_x =   w-string_width(show_text)-8;
	  dest_y =   64+(inst.dest_y-16);
	  TweenFire(id,EaseInOutCubic,TWEEN_MODE_ONCE,true,0,0.5,"x",start_x,dest_x);
	  TweenFire(id,EaseInOutCubic,TWEEN_MODE_ONCE,true,0,0.5,"y",start_y,dest_y);
	  TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,true,3,1,"image_alpha",1,0);
	  TweenFire(id,EaseInOutCubic,TWEEN_MODE_ONCE,true,0,0.2,"image_xscale",0,1);
  }   
	}
	else
	{
  with (instance_create_depth(0,0,0,obj_msn))
	 {
	  show_text = argument0;
	  start_x = w;
	  start_y = 64;
	  dest_x = w-string_width(show_text)-8;
	  dest_y = 64;
	  TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,true,0,0.5,"x",start_x,dest_x);
	  TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,true,0,0.5,"y",start_y,dest_y);
	  TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,true,3,1,"image_alpha",1,0);
	  TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,true,0,0.2,"image_yscale",0,1);
	 }
	}
}