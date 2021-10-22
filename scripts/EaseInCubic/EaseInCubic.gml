/// @description  EaseInCubic(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInCubic(argument0, argument1, argument2, argument3) 
{
 return argument2 * power(argument0/argument3, 3) + argument1;
}