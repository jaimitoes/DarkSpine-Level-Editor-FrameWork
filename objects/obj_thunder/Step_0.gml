event_inherited();
if(!TweenIsPlaying(tween[6]))
{
 dks_tweener_tween_reset(id);
 TweenSet(tween[6],"ease",ease[irandom(te)]);
 TweenPlayDelay(tween[6],irandom(600));
}

if(parent)
{
 for(i =0; i<size; i++)
 {
  child[i].image_blend = image_blend;
 }
}

