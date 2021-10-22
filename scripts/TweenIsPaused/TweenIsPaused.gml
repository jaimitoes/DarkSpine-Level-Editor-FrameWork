/// @description  TweenIsPaused(tween)
/// @param tween
/// @description Checks if tween is paused
function TweenIsPaused(argument0) {

	/// @param tween	tween id

	/// return: bool

	/*
	    Example:
	        if (TweenIsPaused(tween))
	        {
	            TweenResume(tween);
	        }
	*/

	var _t = TGMS_FetchTween(argument0);
	if (is_undefined(_t)) return false;

	return _t[TWEEN.STATE] == TWEEN_STATE.PAUSED;





}
