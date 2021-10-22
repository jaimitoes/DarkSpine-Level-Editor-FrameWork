/// @description dks_spine_check(sprite)
/// @param sprite
function dks_spine_check() 
{
	var a = skeleton_animation_get();
	if(string_length(a)> 0)
	{
	 return true;
	}
	else
	{
	 return false;
	}
}