/// @description dks_sequence_set
function dks_sequence_set(argument0, argument1) 
{
 var t = argument0;
 var start = TweenGet(tween[t], "destination");
 var prop = argument1;
 var s = array_length(tweenS);
 var n = 0, i;
 if is_array(sequence)
 {
  n = array_length(sequence);	
 }
 sequence[n][0] = TweenFire(id, asset_get_index(tweenD[0][0]), TWEEN_MODE_ONCE, 1, tweenD[0][1], tweenD[0][2], prop, start, tweenS[0][t]);
 for(i = 1; i<s; i++)
 {
  sequence[n][i] = TweenSeq(sequence[n][i-1], id, asset_get_index(tweenD[i][0]), TWEEN_MODE_ONCE, 1, tweenD[i][1], tweenD[i][2], prop, tweenS[i-1][t], tweenS[i][t]);
 } 
 
 if(n == 0)
 {
  var a;	
  for (i = 0; i<s; i++)
  {
   if(tweenD[i][3] != "null")
   {
	   if is_array(tweenCst)
				{
				 var s2 = array_length(tweenCst[i]);
				 if (s2 != 0)
				 {
				  a = 0;
				  for(var j =0; j<s2;j++)
				  {
				   a[j] = tweenCst[i][j];	  
				  }
				  show_debug_message("A"+string(a));
				  TweenAddCallback(sequence[0][i], TWEEN_EV_PLAY,id, asset_get_index(tweenD[i][3]), a);
				 }
				 else
				 {
				  TweenAddCallback(sequence[0][i], TWEEN_EV_PLAY,id, asset_get_index(tweenD[i][3]));	  
				 }
				}
				else
				{
				 TweenAddCallback(sequence[0][i], TWEEN_EV_PLAY,id,asset_get_index(tweenD[i][3]));
				} 
   }
   
   if(tweenD[i][4] != "null")
   {
    if is_array(tweenCed)
				{
			     var s3 = array_length(tweenCed[i]);
				 if (s3 != 0)
				 {
				  a = 0;
				  for(var j =0; j<s3;j++)
				  {
				   a[j] = tweenCed[i][j];	  
				  }
				  show_debug_message("A"+string(a));
				  TweenAddCallback(sequence[0][i], TWEEN_EV_FINISH,id, asset_get_index(tweenD[i][4]), a);
				 }
				 else
				 {
				  TweenAddCallback(sequence[0][i], TWEEN_EV_FINISH,id, asset_get_index(tweenD[i][4]));	  
				 }
	   }
				else
				{
				 TweenAddCallback(sequence[0][i],TWEEN_EV_FINISH,id,asset_get_index(tweenD[i][4]));
				} 
   }
   
   if(tweenD[i][5] != "null")
   {
    if is_array(tweenCstop)
				{
				 var s3 = array_length(tweenCstop[i]);
				 if (s3 != 0)
				 {
				  a = 0;
				  for(var j =0; j<s3;j++)
				  {
				   a[j] = tweenCstop[i][j];	  
				  }
				  show_debug_message("A"+string(a));
				  TweenAddCallback(sequence[0][i], TWEEN_EV_STOP,id, asset_get_index(tweenD[i][5]), a);
				  if(tweenD[i][1] > 0)
				  {
				   TweenAddCallback(sequence[0][i], TWEEN_EV_STOP_DELAY,id, asset_get_index(tweenD[i][5]), a);	 
				  }
				 }
				 else 
				 {
				  TweenAddCallback(sequence[0][i], TWEEN_EV_STOP,id, asset_get_index(tweenD[i][5]));	
				  if(tweenD[i][1] > 0)
				  {
				   TweenAddCallback(sequence[0][i], TWEEN_EV_STOP_DELAY,id, asset_get_index(tweenD[i][5]));	 
				  }
				 }
				}
				else
				{
				 TweenAddCallback(sequence[0][i],TWEEN_EV_STOP,id,asset_get_index(tweenD[i][5]));
				 if(tweenD[i][1] > 0)
				 {
				  TweenAddCallback(sequence[0][i], TWEEN_EV_STOP_DELAY,id, asset_get_index(tweenD[i][5]));	 
				 }
				} 
   }
  }
 } 
}