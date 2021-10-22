/// @description  EaseOutCubic(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseOutCubic(argument0, argument1, argument2, argument3) {

	return argument2 * (power(argument0/argument3 - 1, 3) + 1) + argument1;




}
