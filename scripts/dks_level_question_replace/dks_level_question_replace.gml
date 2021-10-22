/// description@ dks_level_question_replace
function dks_level_question_replace() 
{
	scr_level_list_update(level_folder);
	dks_work_save(level_folder,level_name);
	dks_message("Level saved successfully.");exit;               
}