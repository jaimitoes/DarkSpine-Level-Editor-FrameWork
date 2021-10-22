function dks_ambient_tween(argument0) 
{
	if instance_exists(obj_ambient)
	{
	 with(obj_ambient)
	 {
	  TweenFire(id, asset_get_index(argument0[0]), TWEEN_MODE_ONCE, 1, real(argument0[1]), real(argument0[2]),"image_blend",
	  image_blend, make_color_hsv( real(argument0[3]), real(argument0[4]), real(argument0[5])));	 
	 }
	}
}