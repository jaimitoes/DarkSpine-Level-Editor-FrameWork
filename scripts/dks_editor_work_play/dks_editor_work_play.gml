/// @description dks_editor_work_play
function dks_editor_work_play() 
{
	if (is_playing = false)
	{
	 dks_tween_stop(obj_deco);	
	 dks_workspace_get(obj_deco_creator, obj_deco_creator.level_folder, "temp");
	 dks_work_play();
	 is_playing =true;
	 dks_message("PLAYING WORK!");
	}
}