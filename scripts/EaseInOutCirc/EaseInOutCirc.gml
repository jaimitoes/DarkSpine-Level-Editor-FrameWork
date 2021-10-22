/// @description  EaseInOutCirc(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutCirc(argument0, argument1, argument2, argument3) {

	var _val = 2 * argument0 / argument3;

	if (_val < 1) { return argument2 * 0.5 * (1 - sqrt(abs(1 - _val * _val))) + argument1; }

	_val -= 2;
	return argument2 * 0.5 * (sqrt(abs(1 - _val * _val)) + 1) + argument1;




}
