 /// EaseInOutSine(time,start,change,duration)
function EaseInOutSine(argument0, argument1, argument2, argument3) {

	return argument2 * 0.5 * (1 - cos(pi*argument0/argument3)) + argument1;




}
