/// @description  EaseInOutBack(time,start,change,duration)
/// @param time
/// @param start
/// @param change
/// @param duration
function EaseInOutBack(argument0, argument1, argument2, argument3) {

	var _s = 1.70158;
	var _val = argument0/argument3*2;

	if (_val < 1)
	{
	    _s *= 1.525;
	    return argument2 * 0.5 * (((_s + 1) * _val - _s) * _val * _val) + argument1;
	}

	_val -= 2;
	_s *= 1.525;

	return argument2 * 0.5 * (((_s + 1) * _val + _s) * _val * _val + 2) + argument1;




}
