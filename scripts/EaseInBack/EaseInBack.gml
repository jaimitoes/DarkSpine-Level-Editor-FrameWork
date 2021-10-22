/// @description  EaseInBack(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInBack(argument0, argument1, argument2, argument3) 
{
 var _s = 1.70158;
	var _val = argument0/argument3;
	return argument2 * _val * _val * ((_s + 1) * _val - _s) + argument1;
}