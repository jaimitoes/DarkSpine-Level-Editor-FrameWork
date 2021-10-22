/// @description  EaseOutCirc(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseOutCirc(argument0, argument1, argument2, argument3) {

	var _val = argument0/argument3 - 1;
	return argument2 * sqrt(abs(1 - _val * _val)) + argument1;




}
