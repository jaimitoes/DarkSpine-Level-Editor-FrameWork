/// @description  EaseInOutExpo(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutExpo(argument0, argument1, argument2, argument3) {

	var _val = 2 * argument0 / argument3;

	if (_val < 1) { return argument2 * 0.5 * power(2, 10 * --_val) + argument1; }

	return argument2 * 0.5 * (-power(2, -10 * --_val) + 2) + argument1;




}
