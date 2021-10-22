/// @description dks_sequence_node_delete
/// @param target
/// @param node
function dks_sequence_node_delete(argument0, argument1) 
{
	var o = argument0;
	var nod = argument1;
	var s = array_length(tween_sequence);
	for (var i = 0; i<s; i++)
	{
	 if(nod = tween_sequence[i])
	 {
	  instance_destroy(tween_sequence[i]);
	  tween_sequence[@ i] = -1;
	  break;
	 }
	}

	with (o)
	{
	 dks_sequence_destroy(sequence);	
	 sequence = 0;
	}

	var  ts = 0, td = 0, tcst= 0, tced = 0, n = 0;
	for (var i = 0; i<s; i++)
	{
	 if(tween_sequence[i] != -1)
	 { 
	  ts[n][0] = o.tweenS[i][0];
	  ts[n][1] = o.tweenS[i][1];
	  ts[n][2] = o.tweenS[i][2];
	  ts[n][3] = o.tweenS[i][3];
	  ts[n][4] = o.tweenS[i][4];
	  ts[n][5] = o.tweenS[i][5];
	  ts[n][6] = o.tweenS[i][6];
	  ts[n][7] = o.tweenS[i][7];
	  ts[n][8] = o.tweenS[i][8];
	  ts[n][9] = o.tweenS[i][9];
	  ////////////////////////
	  td[n][0] = o.tweenD[i][0];
	  td[n][1] = o.tweenD[i][1];
	  td[n][2] = o.tweenD[i][2];
	  td[n][3] = o.tweenD[i][3];
	  td[n][4] = o.tweenD[i][4];
	  if is_array(o.tweenCst)
	  {
	   var ss = array_length(o.tweenCst[i]);
	   for (var j=0; j<ss; j++)
	   {
	    tcst[n][j] = o.tweenCst[i][j];
	   }	
	  }
	  if is_array(o.tweenCed)
	  {
	   var ss = array_length(o.tweenCed[i]);
	   for (var j=0; j<ss; j++)
	   {
	    tced[n][j] = o.tweenCed[i][j];
	   }	
	  }
	  n+=1;
	 }
	}
	tween_sequence = 0;
	node_target = noone;
	creator.target = target;
	instance_destroy(obj_tween_node);
	o.tweenS = 0;
	o.tweenD = 0;
	o.tweenCst = 0;
	o.tweenCed = 0;

	if is_array(ts)
	{
	 o.tweenS = dks_array2d_copy(ts);	
	 o.tweenD = dks_array2d_copy(td);
	 if is_array(tcst)
	 {
	  o.tweenCst = dks_array2d_copy(tcst);	 
	 }
	 if is_array(tced)
	 {
	  o.tweenCed = dks_array2d_copy(tced);	 
	 }
	}
	dks_tweener_get_data(o);
	dks_tweener_insert_tweens(o);
}