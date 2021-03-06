/// @description  TweenIsStopped(tween)
/// @param tween
/// @description Checks if tween is stopped
function TweenIsStopped(argument0) {

	/// @param tween 	tween id

	/// return: bool

	/*
	    Example:
	        if (TweenIsStopped(tween))
	        {
	            TweenPlay(tween);
	        }
	*/

	var _t = TGMS_FetchTween(argument0);
	if (is_undefined(_t)) return false;

	return _t[TWEEN.STATE] == TWEEN_STATE.STOPPED;





}
