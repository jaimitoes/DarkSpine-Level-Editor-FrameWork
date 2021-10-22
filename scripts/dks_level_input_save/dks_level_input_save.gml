function dks_level_input_save() 
{
 level_name = text_input;
 if (level_name !="")
 {  
  if file_exists(working_directory + "DarkSpine\\Levels\\"+level_folder+"\\"+level_name +".json")
  {
   var st_wid = string_width(text_question[question.AskReplaceLevel,0] + level_name);
   dks_question(420, 64, st_wid, 256, dark_gray, node_color, node_color, dark_gray, text_question[question.AskReplaceLevel][0], level_name);
  }
  else
  {
   scr_level_list_update(level_folder);
   dks_work_save(level_folder, level_name);
   dks_message("Level saved successfully!");
  }
 }
 else
 {
  show_message("No entry name setted, save System canceled");
 }
}