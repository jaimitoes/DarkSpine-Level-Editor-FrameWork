/// Updates...
if (time <=0)
{
 // Ghosted object tilting
 TweenFire(id,EaseInOutSine,TWEEN_MODE_BOUNCE,0,0,30,"image_blend",image_blend,start_color);
 // Reset the timer
 time = 60;
}
time -=1;
// Normalise the colour channels
R = colour_get_red(image_blend)/255;
G = colour_get_green(image_blend)/255;
B = colour_get_blue(image_blend)/255;




