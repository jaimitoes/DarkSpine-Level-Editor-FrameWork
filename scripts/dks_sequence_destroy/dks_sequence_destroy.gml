/// @description dks_sequence_destroy(sequence);
/// @param sequence
function dks_sequence_destroy(argument0) {
	var seq = argument0, i, j, si, sj;
	if is_array(seq)
	{
	 si = array_length(seq);
	 for (i =0; i<si; i++)
	 {
	  sj = array_length(seq[i]);	 
	  for(j = 0; j<sj; j++)
	  {
	   if TweenExists(seq[i][j])
	   {
	    TweenDestroy(seq[i][j]);
	   }
	  } 
	 } 
	}


}
