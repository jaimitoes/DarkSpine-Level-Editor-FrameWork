if !TweenIsPlaying(tween_alpha)
{
 TweenSet(tween_alpha,"start", image_alpha);
 if(image_alpha = 0)
 {
  TweenSet(tween_alpha,"destination", 1);
 }
 else
 {
  TweenSet(tween_alpha,"destination", 0);
 }
 TweenPlay(tween_alpha);
} 


