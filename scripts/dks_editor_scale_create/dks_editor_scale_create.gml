/// @description dks_editor_scale_create(target,target xscale,target yscale)
/// @param target
/// @param target xscale
/// @param target yscale
function dks_editor_scale_create(argument0, argument1, argument2) 
{
 if (!obj_scale_created)
	{
	 var t = argument0;
	 scale_slider[0] = instance_create_depth(t.x,t.y,t.depth,obj_scale);
	 scale_slider[0].sprite_index = spr_xs_slider;
	 scale_slider[0].image_xscale = argument1;
	 scale_slider[0].depth = t.depth-2;
	 scale_slider[0].target = argument0;
	 scale_slider[1] = instance_create_depth(t.x,t.y,t.depth,obj_scale);
	 scale_slider[1].sprite_index = spr_ys_slider;
	 scale_slider[1].image_yscale = argument2;
	 scale_slider[1].depth = t.depth-2;
	 scale_slider[1].target = argument0;
  with(obj_scale)
		{
		 TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,0,0,1,"image_xscale",0,image_xscale);
		 TweenFire(id,EaseOutElastic,TWEEN_MODE_ONCE,0,0,1,"image_yscale",0,image_yscale);
		}
		obj_scale_created = 1;
	}
}