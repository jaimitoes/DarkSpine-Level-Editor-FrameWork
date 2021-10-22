// Global variable to adjust interface coordinates relative to the view size
Cx = camera_get_view_x(Cam);
Cy = camera_get_view_y(Cam);
Cw = camera_get_view_width(Cam);
Ch = camera_get_view_height(Cam);
Mx = device_mouse_x_to_gui(0);
My = device_mouse_y_to_gui(0);

if(global.start_3d)
{
 event_user(2);
}
else
{
 event_user(1);
}


#region Set the app window size
if (!window_get_fullscreen()) 
and (creator.modo = mode.create) 
and (creator.menu_setters = setter.closed)
{
 var w = window_get_width();
 var h = window_get_height();
 var mx = window_mouse_get_x();
 var my = window_mouse_get_y();
 var xx = w -mx;
 var yy = h- my;     
 var diff = abs(xx-yy);
 
 if (mx > w-32) or (my > h-32)
 {
  if (drag=false)
  {
   if (xx<yy)
   {
    if diff>8
    {
     cursor_sprite = spr_curs_resize_x;
    }
    else
    {
     cursor_sprite = spr_curs_resize_xy;
    }
   }
   else
   {
    if diff>8
    {
     cursor_sprite = spr_curs_resize_y;
    }
    else
    {
     cursor_sprite = spr_curs_resize_xy;
    }
   }
   if mouse_check_button_pressed(mb_left)
   {
    switch(cursor_sprite)
    {
     case  spr_curs_resize_x: drag = "drag_x";break;
     case  spr_curs_resize_y: drag = "drag_y";break;
     case  spr_curs_resize_xy: drag = "drag_xy";break;
    }
   } 
  } 
 }
 else
 {
  cursor_sprite = -1;
 }
 
 
 
 if mouse_check_button(mb_left)
 { 
  switch(drag)
  {
   case "drag_xy": 
                  scaler_x = clamp(window_mouse_get_x(),480,11520);
                  scaler_y = clamp(window_mouse_get_y(),270,2160);
                  cam_w =  round(scaler_x);
                  cam_h =  round(scaler_y); 
				  original_w = cam_w;
                  original_h = cam_h;
				  
                  dks_window_resize(Cam, cam_w, cam_h);
				  obj_deco_creator.window_w = cam_w;
                  obj_deco_creator.window_h = cam_h;
				  break;
   case "drag_x":
                 scaler_x = clamp(window_mouse_get_x(),480,11520);
                 cam_w =  round(scaler_x);
                 cam_h =  window_get_height();
				 original_w = cam_w;
                 original_h = cam_h;
				 
                 dks_window_resize(Cam, cam_w, cam_h);
				 obj_deco_creator.window_w = cam_w;
                 obj_deco_creator.window_h = cam_h;
                 break;
   case "drag_y":
                 scaler_y = clamp(window_mouse_get_y(),270,2160);
			     cam_w =  window_get_width();
                 cam_h =  round(scaler_y);
				 original_w = cam_w;
                 original_h = cam_h;
				 
                 dks_window_resize(Cam, cam_w, cam_h);
				 obj_deco_creator.window_w = cam_w;
                 obj_deco_creator.window_h = cam_h;
                 break;      
  }
 }
 if mouse_check_button_released(mb_left)
 {
  drag = false;
 }
}
#endregion
// Global variable to adjust interface coordinates relative to the view size
global.ratio = Cw/original_w;
global.Zoom = 1/global.ratio; 
aspect = Cw/Ch;
if (fov != 0)
{
 Fov = fov;
}
else
{
 Fov = 1;	
}