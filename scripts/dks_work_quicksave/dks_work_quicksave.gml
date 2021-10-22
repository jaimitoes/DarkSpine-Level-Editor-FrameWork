/// @description dks_work_quicksave()
function dks_work_quicksave() 
{
	// Store our current work into a temporary file named "quick save".
	if instance_exists(obj_deco)
	{
	 level_name = "quick save"; 
	 scr_level_list_update( level_folder);
	 dks_work_save(level_folder,level_name);
	 dks_message("LEVEL SAVED IN ["+level_folder+"\\"+string(level_name)+"]");
	}
	else
	{
	 dks_message("Nothing to save!");
	}      
}