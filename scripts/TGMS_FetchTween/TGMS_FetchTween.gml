/// @description  TGMS_FetchTween(tween_id)
/// @param tween_id
function TGMS_FetchTween(argument0) {

	if (ds_map_exists(global.TGMS_MAP_TWEEN, argument0))
	{
	    return global.TGMS_MAP_TWEEN[? argument0];
	}

	if (is_undefined(argument0))
	{
	    return undefined;
	}

	// Show "invalid tween id" error message
	show_error("!!! INVALID TWEEN ID!!!",1);


}
