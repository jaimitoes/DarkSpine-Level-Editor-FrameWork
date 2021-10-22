function dks_sequence_play() 
{
	dks_sequence_destroy(sequence);
	sequence = 0;
	for (var i = 0; i<10; i++)
	{
	 if TweenExists(tween[i])
	 {
	  TweenPlay(tween[i]);	 
	 }
	}
}