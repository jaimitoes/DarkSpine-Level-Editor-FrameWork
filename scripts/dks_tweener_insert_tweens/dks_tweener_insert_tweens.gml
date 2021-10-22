function dks_tweener_insert_tweens(argument0) 
{
 var object = argument0.id;
 var dataval;
 dataval[0][0] = "x";
 dataval[0][1] = object.x;
 dataval[1][0] = "y";
 dataval[1][1] = object.y;
 dataval[2][0] = "image_xscale";
 dataval[2][1] = object.image_xscale;
 dataval[3][0] = "image_yscale";
 dataval[3][1] = object.image_yscale;
 dataval[4][0] = "image_angle";
 dataval[4][1] = object.image_angle;
 dataval[5][0] = "image_alpha";
 dataval[5][1] = object.image_alpha;
 dataval[6][0] = "image_blend";
 dataval[6][1] = object.image_blend;
 dataval[7][0] = "depth";
 dataval[7][1] = object.depth; 
 dataval[8][0] = "x_rotation";
 dataval[8][1] = object.x_rotation;
 dataval[9][0] = "y_rotation";
 dataval[9][1] = object.y_rotation;
 if is_array(object.tween)
 {
  for (var i=0;i<10;i++)
  {
   if (k_set[i] !=0)
   {
	if TweenExists(object.tween[i])
	{
	 TweenDestroy(object.tween[i]);
	}
	if (i = 6)
	{
	 object.tween[@ i] = TweenCreate( object, param[i][0], param[i][1], true, param[i][2], param[i][3], dataval[i][0], param[i][4], param[i][5]);
	}
	else
	{
	 object.tween[@ i] = TweenCreate( object, param[i][0], param[i][1], true, param[i][2], param[i][3], dataval[i][0], dataval[i][1] + param[i][4], dataval[i][1] + param[i][5]);
	}
	object.have_tween = 1;
	with(object)
	{
	 if is_array(tweenS)
	 {
      TweenAddCallback(tween[i], TWEEN_EV_FINISH, id, dks_sequence_set, i, dataval[i][0]);
	 }
	}
   }
  } 
 }
 else
 {
  for (var i=0;i<10;i++)
  {
   if (k_set[i] !=0)
   {
	if (i = 6)
	{
	 object.tween[i] = TweenCreate( object, param[i][0], param[i][1], true, param[i][2], param[i][3], dataval[i][0], dataval[i][1], param[i][4]);
	}
	else
	{
	 object.tween[i] = TweenCreate( object, param[i][0], param[i][1], true, param[i][2], param[i][3], dataval[i][0], dataval[i][1] + param[i][4], dataval[i][1] + param[i][5]);
	}
	object.have_tween = 1;
	with(object)
	{
	 if is_array(tweenS)
	 {
      TweenAddCallback(tween[i], TWEEN_EV_FINISH, id, dks_sequence_set, i, dataval[i][0]);
	 }
	}
   }
   else
   {
	object.tween[i] = -1;
   }
  } 
 }
}
