function dks_gui_full_screen_set() 
{
	if window_get_fullscreen()
	{
	 var w = window_w;
	 var h = window_h;
	 if instance_exists(obj_cam_editor)
	 {
	  obj_cam_editor.original_w = w;
	  obj_cam_editor.original_h = h;
	  obj_cam_editor.cam_w = w;
	  obj_cam_editor.cam_h = h;
	 }
	 window_set_fullscreen(false);
	 dks_window_resize(Cam,w,h);
	}
	else
	{
	 window_w = window_get_width();
	 window_h = window_get_height();
	 if instance_exists(obj_cam_editor)
	 { 	 
	  obj_cam_editor.original_w = display_w;
	  obj_cam_editor.original_h = display_h;
	  obj_cam_editor.cam_w = display_w;
	  obj_cam_editor.cam_h = display_h;
	 }
	 dks_window_resize(Cam, display_w, display_h);
	 window_set_fullscreen(true);
	}
}