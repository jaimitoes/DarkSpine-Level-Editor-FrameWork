/// @description dks_cam_update_pos(Cam id);
function dks_cam_update_pos(argument0) 
{
	//Adjust the behavior of our camera depending on whether we have selected an object.
	if (target_view) // This variable activate/deactivate the target following
	{
	 if mouse_check_button_pressed(mb_any)
	 {
	  target_view = 0;// When we press any mouse button, our camera stops following the selected object, leaving it free for manual operation, 
	  //we can also deactivate the option of auto adjustment of position towards an object.
	  center_x = camera_get_view_x(argument0) +wid;
	  center_y = camera_get_view_y(argument0) +hei;
	  exit;
	 }
       
	 //If we are following an object, a lerp transition move the camera to the target	   
	 if(target != noone) and (instance_exists(target))
	 {
	  x = floor(lerp (x,target.x,0.05));
	  y = floor(lerp (y,target.y,0.05));
	  camera_set_view_pos(argument0, x-wid, y -hei);
	 }
	 else
	 {
	  // Freeze the camera if the instance does not exists	 
	  x = floor(lerp (x,obj_editor_control.save_view_x,0.05));
	  y = floor(lerp (y,obj_editor_control.save_view_y,0.05));
	  camera_set_view_pos(argument0, x-wid, y -hei);
  
	 } 
	}
	else
	{
	 if !mouse_check_button(mb_middle)
	 {
	  // Free camera mode
	  camera_set_view_pos(argument0, x-wid, y -hei);
	 }
	}
}