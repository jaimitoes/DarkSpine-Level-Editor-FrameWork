/// @description 2D CAM END STEP EVENT
// Puede escribir su código en este editor
Cx = camera_get_view_x(Cam);
Cy = camera_get_view_y(Cam);
Cw = camera_get_view_width(Cam);
Ch = camera_get_view_height(Cam);
global.mouse_xd = mouse_x;
global.mouse_yd = mouse_y;
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
// The center of the view port
wid = Cw*0.5;
hei = Ch*0.5;
///Check keyboard keys
if keyboard_check_pressed(vk_anykey)
{
 switch(keyboard_key)
 {
  case vk_f2:	 
  gpu_set_zwriteenable(1);	
  //gpu_set_ztestenable(1);	
  view_set_visible( 0, 0);
  view_set_visible( 1, 1);
  global.start_3d = true;
  exit;
  // Go back to the DarkSpine´s main menu
  case vk_escape:
  if !instance_exists(obj_editor_control)
  {
   instance_destroy(obj_deco);// Destroy the full level
   dks_level_load("Launcher", "DarkSpine_launcher"); // Load the DarkSpine´s main menu
   exit;
  }
  break;
 } 
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
camera_set_view_border(Cam,wid,hei);
R = global.ratio;
Z = global.Zoom;
// Update the view targeting
//Adjust the behavior of our camera depending on whether we have selected an object.
if (target_view)
{
 if(target != noone) and (instance_exists(target))
 {
  if(_3d)
  {
   z = lerp(z,target.depth,0.1);
  }
  if (cam_xoffset != target_xf)
  {
   cam_xoffset = target_xf;
   lerpSpeedX =0.004*R;
   alarm[0] = 50;
  }
  x = lerp(x, target.x + target_xf*R,lerpSpeedX*Z);
  y = lerp(y, target.y + target_yf*R,lerpSpeedY*Z);
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
}
else
{
 if !mouse_check_button(mb_middle)
 {
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
}
  
if(room_limit)
{
 if(camera_get_view_x(Cam)<0)
 {
  x = wid;	 
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
 else if(camera_get_view_x(Cam)+Cw>room_width)
 {
  x = room_width-wid;
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
 
 if(camera_get_view_y(Cam)<0)
 {
  y = hei;	 
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
 else if(camera_get_view_y(Cam)+Ch>room_height)
 {
  y = room_height-hei;	 
  camera_set_view_pos(Cam, x-wid, y-hei);
 }
}