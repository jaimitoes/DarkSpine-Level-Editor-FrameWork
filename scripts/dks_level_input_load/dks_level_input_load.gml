function dks_level_input_load() 
{
	if file_exists(working_directory + "DarkSpine\\Levels\\"+level_folder+"\\"+text_input+".json")
	{ 
	 var st_wid = string_width(text_question[question.AskLoadLevel][0] + text_input);
	 dks_question(420,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.AskLoadLevel][0],text_input)
	} 
	else
	{
	 dks_message("warning! No level found in this slot!");
	}
}