/// @description  TweensTarget(target)
/// @param target
/// @description returns tween ids associated with target, for scripts supporting 'tween[s]' argument
function TweensTarget(argument0) {

	/// @param target   target instance associated with tweens

	/*
	    The Tweens* scripts can be used with any tween scripts
	    which show 'tween[s]' as an argument.
    
	    e.g.
	        TweenPause(TweensTarget(id)); // pause all tweens associated with target instance
	        TweenResume(TweensTarget(obj_Player));
	*/

	return "3"+string(argument0);






}
