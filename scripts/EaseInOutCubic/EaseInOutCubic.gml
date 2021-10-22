/// @description  EaseInOutCubic(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutCubic(argument0, argument1, argument2, argument3) {

	var _val = 2 * argument0 / argument3;

	if (_val < 1) { return argument2 * 0.5 * power(_val, 3) + argument1; }

	return argument2 * 0.5 * (power(_val - 2, 3) + 2) + argument1;




}
