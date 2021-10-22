/// @description 2D CAM END STEP EVENT
// Puede escribir su código en este editor
global.mouse_xd = mouse_x;
global.mouse_yd = mouse_y;
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
// The center of the view port
wid = Cw*0.5;
hei = Ch*0.5;
// Update the target status
if(target != creator.target)
{
 target = creator.target;
 target_view = 1;
 if (target != noone)
 {
  dks_cam_update_z(id,Cx,Cy,creator.depth);exit;
 }
}
///Check keyboard keys
if keyboard_check_pressed(vk_f2)
{
 gpu_set_zwriteenable(1);	
 //gpu_set_ztestenable(1);	
 view_set_visible( 0, 0);
 view_set_visible( 1, 1);
 dks_message("Z-buffer activated");
 global.start_3d = true;exit;
 
}
// Every time you press the middle mouse button, coordinates and camera data are stored
if mouse_check_button_pressed(mb_middle)
{
 dks_set_offset(id,Mxd,Myd);
 target_view = 0;
}
// Update mouse wheel
if(mouse_check_button(mb_middle))
{
 // rotate the camera from the xRotation and yRotation axis
 if(keyboard_check(vk_control))
 {
  var scalerx = (Mxd-mouse_startx)*0.01;
  var scalery = (Myd-mouse_starty)*0.01;
  x_rotation = anoffx +scalerx;
  y_rotation = anoffy -scalery;
 }
 else
 {
  // move the camera from the X and Y axis
  camera_set_view_pos(Cam, Cx + (mouse_startx-Mxd), Cy + (mouse_starty-Myd));
 }
}
else
{// Zoom in and Zoom out
 if (mouse_wheel_up())
 {
  if TweenIsPlaying(t_zoom)
  {
   TweenStop(t_zoom);
  }
  
  // Speed up by x2 while you press the CONTROL key
  if keyboard_check(vk_control)
  {
   cam_w -= zoom_trans*2;
  }
  else
  {
   cam_w -= zoom_trans;
  }
  
  if  (cam_w <=zoom_trans)
  {
   cam_w = zoom_trans;
  }
  cam_h  = cam_w*(original_h/original_w);
  
  TweenSet(t_zoom,"start",Cw);
  TweenSet(t_zoom,"destination",cam_w);
  TweenPlay(t_zoom);
 }
 
 if (mouse_wheel_down())
 {
  if keyboard_check(vk_control)
  {
   cam_w += zoom_trans*2;
  }
  else
  {
   cam_w += zoom_trans;
  }
  cam_w += zoom_trans;
  cam_h  = cam_w*(original_h/original_w);
  if TweenIsPlaying(t_zoom)
  {
   TweenStop(t_zoom);
  }
  TweenSet(t_zoom,"start", Cw);
  TweenSet(t_zoom,"destination",cam_w);
  TweenPlay(t_zoom);
 }
}
// Centering the camera view
if mouse_check_button_released(mb_middle)
{
 center_x = Cx +wid;
 center_y = Cy +hei;
 x = center_x;
 y = center_y;
}
// Update the view targeting
dks_cam_update_pos(Cam);