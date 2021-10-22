/// @description dks_spine_animation_set(spine sprite)
/// @param spine sprite
function dks_spine_animation_set(argument0) {
	if skeleton_animation_get() != argument0
	{
	 skeleton_animation_set(argument0);
	}



}
