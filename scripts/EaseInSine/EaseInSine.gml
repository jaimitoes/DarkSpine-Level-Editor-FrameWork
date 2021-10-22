/// @description  EaseInSine(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInSine(argument0, argument1, argument2, argument3) {

	return argument2 * (1 - cos(argument0 / argument3 * (pi / 2))) + argument1;




}
