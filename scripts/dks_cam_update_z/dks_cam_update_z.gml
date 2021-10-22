/// @function dks_cam_update_z(id of cam, viewx, viewy, depth value)
/// @param CamId
/// @param Xview
/// @param Yview
/// @param NewDepth
function dks_cam_update_z(argument0, argument1, argument2, argument3) 
{
	with(argument0)
	{
	 center_x = argument1+wid;
	 center_y = argument2+hei;
	 zz= argument3;
	 TweenFire(id,EaseInOutSine,TWEEN_MODE_ONCE,1,0,0.6,"z",z,zz);
	}
}