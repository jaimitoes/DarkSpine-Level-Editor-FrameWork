/// @description Editor variables
/////////
if is_array(variables)
{
  dks_array_update(val,variables);
  view_trans = real(val[0]);
  _3d = real(val[1]);
  cam_w = real(val[2]);
  cam_h = real(val[3]);
  target_xf = real(val[4]);
  target_yf = real(val[5]);
  room_limit = real(val[6]);
  depth = real(val[7]);
  lerpSpeedX = real(val[8]);
  lerpSpeedY = real(val[9]);
  fov = real(val[10]);
  //////////////////////////////////
  wid = cam_w*0.5;
  hei = cam_h*0.5;
  cam_xoffset = target_xf;
  
} 
else
{
 depth = 32000;
}
//////////

 
if(parent)
{
 target = child[0];
 target_view = 1;
}
else
{
 target = noone;
 target_view = 0;
}

Cw = cam_w;
Ch = cam_h;
wid = cam_w * 0.5;
hei = cam_h * 0.5;
camera_set_view_size(Cam, Cw, Ch);
center_x = camera_get_view_x(Cam) + wid;
center_y = camera_get_view_y(Cam) + hei;
camera_set_view_pos(Cam,x -wid,y -hei);
TweenSet(t_zoom,"start",Cw);
TweenSet(t_zoom,"destination",cam_w);
TweenPlay(t_zoom);
draw_method = dks_null;