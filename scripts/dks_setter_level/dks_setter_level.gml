function dks_setter_level() 
{
	var in_button;
	  /*
	  if show_question("De verdad desea ELIMINAR este nivel?")
	  {
	   level_name = "null";
	   level_list[| in_button] = undefined;
	   scr_level_list_update();exit;
	  }*/
  
	  if mouse_check_button_pressed(mb_left)
	 {
	  if not instance_exists(obj_question)
	  {
   
 
	   in_button =  dks_button_press(button_level_folder_info);
	  if (in_button > -1)
	  {
	    var st_wid = string_width(text_question[question.LevelFolder][0] +level_folder)+128;
	    dks_question_input(420,0,st_wid,96,dark_gray,node_color,node_color,dark_gray,text_question[question.LevelFolder][0],string(level_folder));
	  }
  
  
  
  
	  in_button = dks_button_press(menu_b_level_del);
	  if (in_button !=-1)
	  {
	   var st_wid = string_width(text_question[question.DeleteLevel][0] + level_list[| in_button]);
	   dks_question(420,0,st_wid,96,dark_gray,node_color,node_color,dark_gray,text_question[question.DeleteLevel][0],level_list[| in_button]);
	  }
  
	  }  
	  in_button = dks_button_press(menu_b_level_select);
	  ///////////////////////////////////////////////////////////////
	  if (in_button != -1)
	  {
	   if instance_exists(obj_question)
	   {
	    with(obj_question)
	    {
	     if(input != noone)
	     {
	      dks_input_set_text(input,other.level_list[| in_button]);
	     }
	    }
	   }
	   else
	   {
	    var st_wid = string_width(text_question[question.AskLoadLevel][0] + level_list[| in_button]);
	    dks_question(420,0,st_wid,96,dark_gray,node_color,node_color,dark_gray,text_question[question.AskLoadLevel][0],level_list[| in_button])
	   }
	  }
	  in_button = dks_button_press(menu_b_level_str)
	  if (in_button !=-1)
	  {
   
	   switch(in_button)
	   {
	    case 0 :
	    var st_wid = string_width(text_question[question.LoadLevelInput][0] +" "+string(level_name));
	    dks_question_input(420,0,st_wid+128,96,dark_gray,node_color,node_color,dark_gray,text_question[question.LoadLevelInput][0],string(level_name));break;
	    case 1 : 
	    var st_wid = string_width(text_question[question.SaveLevelInput][0] +" "+string(level_name));
	    dks_question_input(420,0,st_wid,96,dark_gray,node_color,node_color,dark_gray,text_question[question.SaveLevelInput][0],string(level_name));break;
	   }
	  }
	 } 
      


	////////////////////////////////////////

	//Level ordering

	if mouse_check_button_pressed(mb_right)
	{
	 var press = dks_button_press(menu_b_level_select);
	 if (press >-1)
	 {
	  level_reorder = press;
	 }
	 else
	 {
	  level_reorder = -1;
	 }
	}

	if mouse_check_button_released(mb_right)
	{
	 if(level_reorder != -1)
	 {
	  var press = dks_button_press(menu_b_level_select);
	  if (press >-1)
	  {
	   if (level_reorder != press)
	   {
	    var name;
	    name = level_list[| level_reorder];
	    level_list[| level_reorder] =  level_list[| press];
	    dks_button_add_text(menu_b_level_select,level_reorder, level_list[| press]);
	    level_list[| press] = name;
	    dks_button_add_text(menu_b_level_select, press, name);
	   }
	   else
	   {
	    level_reorder = -1;
	   }
	  }
	  else
	  {
	   level_reorder = -1;
	  }
	 }
	}  
}