event_inherited();
///Local variables
ease = EaseLinear;
Mode = TWEEN_MODE_ONCE;
Dur = 60;
object_place = obj_hero;
tween_target = "null";
destroy = 1;
////////////////////////////////////////
///In Editor variables update data(Link between local variables)
val[0] = ease;
val[1] = Mode;
val[2] = Dur;
val[3] = object_place;
val[4] = tween_target;
val[5] = destroy;
////////////////////////////////////Internal object system
tween_path = -1;
_path = -1;
tween_exists = 0;
object_target = -1;
Px = 0;
Py = 0;
i = 0;
s= -1;
pl = -1;
/////////////////////////////////////////


