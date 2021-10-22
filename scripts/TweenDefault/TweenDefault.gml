/// @description  TweenDefault()
/// @description Returns default tween for setting default tween data
function TweenDefault() {
	/*
	    Returns default tween data which is used as base for each new tween.
	    You can, for example, use this to set default groups and time scales for new tweens
    
	    e.g. 
	        // Change default tween properties
	        TweenSetGroup(TweenDefault(), 5);
	        TweenSetTimeScale(TweenDefault(), 0.5);
    
	        // Following tweens will have GROUP and TIME SCALE of default tween
	        tween1 = TweenCreate(id);
	        tween2 = TweenCreate(id);
	*/

	return 1;




}
