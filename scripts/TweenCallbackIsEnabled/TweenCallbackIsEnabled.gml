/// @description  TweenCallbackIsEnabled(callback)
/// @param callback
/// @description Checks if callback is enabled
function TweenCallbackIsEnabled(argument0) {

	/// @param callback 		callback id

	/// return: bool

	var _cb = argument0;

	if (is_array(_cb))
	{
	    return _cb[TWEEN_CALLBACK.ENABLED] && _cb[@ TWEEN_CALLBACK.TARGET] != noone;;
	}





}
