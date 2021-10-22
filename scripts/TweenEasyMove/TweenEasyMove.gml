/// @description  TweenEasyMove(x1,y1,x2,y2,delay,duration,ease[,mode])
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param delay
/// @param duration
/// @param ease[
/// @param mode]
/// @description Tweens instance's x/y position
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2
/// @param {real} delay
/// @param {real} duration
/// @param {real} ease
/// @param {real} [mode]
function TweenEasyMove() {

	var _mode;
	if (argument_count == 8) _mode = argument[7];
	else                     _mode = 0;

	if (variable_instance_exists(id, "__TweenEasyMove"))
	{
		if (TweenExists(__TweenEasyMove))
		{
			TweenDestroy(__TweenEasyMove);
		}
	}

	__TweenEasyMove = TweenFire(id, argument[6], _mode, global.TGMS_EasyDelta, argument[4], argument[5], "x", argument[0], argument[2], "y", argument[1], argument[3]);
	return __TweenEasyMove;







}
