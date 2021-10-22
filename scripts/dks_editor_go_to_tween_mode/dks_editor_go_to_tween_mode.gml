function dks_editor_go_to_tween_mode() 
{
	if (target != noone)
	{
	 modo = mode.animator;
	 if not instance_exists(obj_motion_controller)
	 {
	  instance_create_depth(x,y,depth,obj_motion_controller);
	 }
	 //dks_button_move_to_bottom(button_tween_timeline);
	 //dks_button_move_to_bottom(button_tween_playback);
	 //dks_button_move_to_bottom(button_tween_keys);
	 //dks_button_move_to_bottom(button_tween_icon);
	 ///dks_button_move_to_bottom(button_tween_input);
	 //dks_button_move_to_bottom(button_tween_key);
	 exit;
	}
	 else
	 {
	  dks_message("First, you must to select an object");
	 }
}