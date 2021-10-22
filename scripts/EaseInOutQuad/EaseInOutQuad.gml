/// @description  EaseInOutQuad(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutQuad(argument0, argument1, argument2, argument3) {

	var _arg0 = 2*argument0/argument3;

	if (_arg0 < 1){
	    return argument2 * 0.5 * _arg0 * _arg0 + argument1;
	}

	return argument2 * -0.5 * ((_arg0-1) * (_arg0 - 3) - 1) + argument1;





}
