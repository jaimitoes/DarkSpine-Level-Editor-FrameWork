/// @description  Ease(value1,value2,amount,ease)
/// @param value1
/// @param value2
/// @param amount
/// @param ease
/// @description Interpolates two values by a given amount using specified ease algorithm
/// @param value1	start value
/// @param value2	end value
/// @param amount	(0-1) amount to interpolate values
/// @param ease		ease algorithm script
function Ease(argument0, argument1, argument2, argument3) {

	/// return: real
	/*  
	    Example:
	        var _start = x;
	        var _dest  = mouse_x;
	        var _amount = 0.25;
	        var _ease = EaseInOutQuad;
        
	        x = Ease(_start, _dest, _amount, _ease);
	*/

	gml_pragma("forceinline");

	return script_execute(argument3, argument2, argument0, argument1-argument0, 1);





}
