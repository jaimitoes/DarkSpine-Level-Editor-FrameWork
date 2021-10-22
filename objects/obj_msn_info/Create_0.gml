///This object shows in a randomized method tips and tricks of the editor...
// ...drawing a set of messages giving us some info relative with the managment of the current mode.
if (instance_exists(obj_deco_creator)) and (obj_deco_creator.show_interface) and (instance_exists(obj_editor_control))
{//This conditional loads only the necesary data depending on the current mode.
    switch(obj_deco_creator.modo)
    {
     case mode.create: dks_info_create_mode();break;
     case mode.edit: dks_info_edit_mode();break;
     case mode.ffd_create : dks_info_ffd_create_mode();break;
     case mode.ffd_edit : dks_info_ffd_create_mode();break;
     case mode.multiple : dks_info_multiple_mode();break;
     case mode.animator: dks_info_animator_mode();break;
     case mode.polygon: dks_info_polygon_mode();break;
    }
}
else
{
 
 instance_destroy();exit;
}

// Randomize the message from the array text library in every creation
show_text = text[irandom(array_length(text)-1)];
//Tween universal variables
t_var1 =0;
t_end =0;
tween = TweenCreate(id,EaseOutQuad,TWEEN_MODE_ONCE,true,0,1.4,"image_alpha",image_alpha,1);
//Set the x position and tween it to the center of screen
x = window_get_width() + 1000;
TweenFire(id,EaseOutCirc,TWEEN_MODE_ONCE,true,0,1,"x",x,window_get_width()/2);
//Set a timer to tween the alpha value of the object, fading the text
timer = 300;
// The time discount switcher
timer_start = 0;
// Set the default y axis coordinate
y_pos = window_get_height()-32;
TweenPlay(tween);

