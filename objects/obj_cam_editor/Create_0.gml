event_inherited();///As a child object, this deco object needs to inherite the parent data to 
//profit the variables in new objects...
creator = obj_deco_creator;// Assign the Id of our Object creator...
//Store offset coordinates from the mouse and views
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
Cx = 0;
Cy = 0;
Ch = 0;
Cw = 0;
Mx = 0;
My = 0;
Dx = 0;
Dy = 0;
Cxf = 0;
Cyf = 0;
zoom_trans = creator.interface[0];//This variables[ Stored in the interface array] set how many pixels our camera travels every time we move the mouse wheel.
target_view =noone; // This variable set if a camera are following a Deco targeted object.
drag = false;/// This variables set how to manage the resizing screen depending on the coordinates of our mouse.[ x, y, xy].
// This 2 variables stores the new window size while we are adjusting this with the mouse.
scaler_x =0;
scaler_y =0;
//The current view size
cam_w = camera_get_view_width(Cam);
cam_h = camera_get_view_height(Cam);
// The center of the current view size
wid = cam_w *0.5;
hei = cam_h *0.5;
// The center of the current view size relative to the camera position
center_x = camera_get_view_x(Cam) + wid;
center_y = camera_get_view_y(Cam) + hei;
// FullScreen Check, this variables stores the default display size in windowed mode and fullScreen mode.
if (window_get_fullscreen())
{
 original_w = display_get_width();
 original_h = display_get_height();
}
else
{
 original_w = window_get_width();
 original_h = window_get_height();
}
// Set the Z buffer variables, z represent the camera view depth using the Z buffer.
z = 0;
fov = creator.interface[Interface.foview];
Fov = fov;
aspect = cam_w/cam_h;
// zz represents the current range depth from the z variable to the zz variable.
zz = creator.depth;
// The current target to follow with the camera.
target = creator.target;
// Universal variable to use with the Tween engine
t_var1 = 1;
// Gpu settings to adjust the 3D propoerties...
gpu_set_texrepeat(1);
// The default viewport
view_wport[0] =  cam_w;
view_hport[0] =  cam_h;
// Set the default position of our camera
camera_set_view_pos(Cam, x - wid, y -hei);
t_zoom = TweenCreate(id,EaseOutSine,TWEEN_MODE_ONCE,0,0,20,"screenZoom",cam_w,cam_w);
// We don´t need the image_speed variable, so we set this one to Zero.
image_speed = 0;
viewmatgui2D = 0;
viewmatgui3D = 0;
projmatgui2D = 0;
projmatgui3D = 0;
worldmat = 0;
show_camera_debug = 0;
//Proj = [2, 0, 0, 0, 0, 3.56, 0, 0, 0, 0, 1.00, 1, -0.00, 0.00, -1.00, 0];