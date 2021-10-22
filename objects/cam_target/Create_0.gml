///Light version of the object "Obj_cam_editor" with some changes to be a camera follower with special privileges.
event_inherited();//Get the Deco object default variables
//////////////CUSTOM VARIABLES////////////////////////////
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
// Create a custom array to link the editor variables data
val[9] = 0;
val[10] = 32;//fov
////// The customized variables editable from the editor
view_trans = 60;// variables[0]
_3d = 0; //variables[1]
cam_w = camera_get_view_width(Cam); //variables[2]
cam_h = camera_get_view_height(Cam);//variables[3]
target_xf = 0;//variables[4]
target_yf = 0;//variables[5]
room_limit = 0;//variables[6]
//depth = variables[7]
lerpSpeedX = 0.05;//variables[8]
lerpSpeedY = 0.05;//variables[9]
//////////////////////////////////////////////////////////////
// The camera does not start following any object, so, this one is setted like a Free Cam
target_view = noone;
//THis variable check if we are dragging the sides of the window app in the Windowed mode
drag = false;
// A variable created to multiply values
scaler_x = 0;
scaler_y = 0;
Cx = camera_get_view_x(Cam);// Get the current view X pos on the  End step event.
Cy = camera_get_view_y(Cam);// Get the current view Y pos on the  End step event.
Cw = camera_get_view_width(Cam);// Get the current view width on the  End step event.
Ch = camera_get_view_height(Cam);// Get the current view height on the End step event.
//  Get the center of view
wid = cam_w * 0.5;
hei = cam_h * 0.5;
// Get the center of view relative to the world coordinates
center_x = Cx + wid;
center_y = Cy + hei;
// Get the display size of the application
if window_get_fullscreen()
{
 original_w = display_get_width();
 original_h = display_get_height();
}
else
{
 original_w = window_get_width();
 original_h = window_get_height();
}
// Custom depth variable
z = 0;
zoom_trans = 128;
// Z-buffer settings
global.start_3d = true;
fov = 32;
Fov = 32;
aspect = cam_w/cam_h;
R = 0;
Z = 0;
// This variable check the offset between the camera and its target,...
//...if that one does not match with this variable, we reduce the speed of the camera traslation effect...
cam_xoffset = 0;
// Custom variable that can be used with a Tween script
//t_var1 = 0;
view_wport[0] =  cam_w;
view_hport[0] =  cam_h;
camera_set_view_pos(Cam, x - wid , y - hei);
//Check the TweenGMS manual to see how you can set your custom scripts and Tween it. 
t_zoom = TweenCreate(id,EaseOutSine,0,0,0,40,"screenZoom",cam_w,cam_w);
target = noone;
depth = 32000;