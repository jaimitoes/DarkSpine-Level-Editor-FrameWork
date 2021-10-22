///Update, timer checking, tween checking, destroy checking

// If the editor does not exists, this object is auto destroyed...
if !instance_exists(obj_editor_control)
{
 instance_destroy();
}

// if the object are not fading the alpha value
if !TweenIsActive(tween)
{
 if not (timer_start = 2) // IF the time switcher are not setted to 2
 {
  timer_start = 1; //Switch to execute the conditional stored in the value 1
 }
}
// Executing the conditional in case of true and discounting 1 unit from the timer
if (timer_start = 1)
{
 timer -=1;
}
// If the timer values are less or equal than zero, the text fade tween is executed..
if (timer<=0)
{
 t_end = TweenFire(id,EaseOutQuad,TWEEN_MODE_ONCE,true,0,1.4,"image_alpha",image_alpha,0);
 timer = 500;
 timer_start =2;
}
//While the text fading is finished, this object is automatically destroyed
if (timer_start = 2)
{
 if !TweenExists(t_end)
 {
  TweenDestroy(tween);
  instance_destroy();
 }
}


