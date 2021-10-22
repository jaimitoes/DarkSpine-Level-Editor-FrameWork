/// @description 3D CAM END STEP EVENT
// Puede escribir su código en este editor

// The center of the view port
wid = Cw*0.5;
hei = Ch*0.5;
global.mouse_xd = Cx + (Mx*global.ratio);
global.mouse_yd = Cy + (My*global.ratio);
Mxd = global.mouse_xd;
Myd = global.mouse_yd;

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
if keyboard_check_pressed(vk_anykey)
{
 switch(keyboard_key)
 {
  case vk_f2 :	 
  gpu_set_zwriteenable(0);	
  //gpu_set_ztestenable(0);	
  view_set_visible( 0, 1);
  view_set_visible( 1, 0);
  dks_message("Z-buffer deactivated");
  global.start_3d = false;exit;
  break;
  case vk_f4:
  x_rotation = 0;
  y_rotation = 0;
  break;
  case vk_f11:
  show_camera_debug = !show_camera_debug;
  break;
 }
}
// Every time you press the middle mouse button, coordinates and camera data are stored
if mouse_check_button_pressed(mb_middle)
{
 Dx = Mx;
 Dy = My;
 Cxf = Cx;
 Cyf = Cy;
 dks_set_offset(id, Mxd, Myd);
 target_view = 0;
}
// Update mouse wheel
if(mouse_check_button(mb_middle))
{
 // rotate the camera from the xRotation and yRotation axis
 if(keyboard_check(vk_control))
 {
  var scalerx = (Dx-Mx)*0.02;
  var scalery = (Dy-My)*0.02;
  x_rotation = anoffx -scalerx;
  y_rotation = anoffy +scalery;
 }
 else
 {
  
  // move the camera from the X and Y axis
  x = Cxf + (Dx - Mx)*global.ratio;
  y = Cyf + (Dy - My)*global.ratio;
  camera_set_view_pos( Cam, x , y);  
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