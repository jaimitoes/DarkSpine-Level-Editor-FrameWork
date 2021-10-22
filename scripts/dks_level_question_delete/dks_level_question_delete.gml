function dks_level_question_delete() 
{
	var level = text_response2;
	var s = ds_list_size(level_list);
	for (var i =0;i<s;i++)
	{
	 if (level = level_list[| i])
	 {
	  level_list[| i] = undefined;
	  level_name = "null";
	  scr_level_list_update(level_folder);
	  dks_message("The level "+level+" has been deleted"); 
	  break;
	 }
	}
}