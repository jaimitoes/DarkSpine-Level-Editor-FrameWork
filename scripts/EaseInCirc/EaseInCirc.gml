/// @description  EaseInCirc(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInCirc(argument0, argument1, argument2, argument3) 
{
 var _val = argument0/argument3;
	return argument2 * (1 - sqrt(1 - _val * _val)) + argument1;
}