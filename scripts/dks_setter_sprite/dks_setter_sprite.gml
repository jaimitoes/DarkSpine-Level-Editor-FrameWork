function dks_setter_sprite() 
{
	if (mouse_check_button_pressed(mb_left))
	{
  var sz = ds_list_size(sprite_tab);
		in_button = dks_button_press(menu_b_tab_sprite);
		if (in_button != -1)
		{
			if(current_tab = -1)
			{
			 current_tab = 0;
			 dks_sprite_swap(id,"sprite",1);
             
			 exit;
			}
			switch(in_button)
			{
			 case 0 :
			 for (var i=0; i<sz;i++)
			 {
			  if (current_tab = i)
			  {
			   if  (i != 0)
			   {
			    current_tab = i-1;break;
      }
			   else
			   {
			    current_tab = sz-1;break;
			   }
			  }
			 }
			 break;
			 case 1 :
			 for (var i=0; i<sz;i++)
			 {
			   if (current_tab = i)
			   {
			     if  (i!= sz-1)
			     {
			      current_tab = i+1;break;
			     }
			     else
			     {
			      current_tab = 0;break;
			     }
			   }
			 }
			 break;
			}
   dks_sprite_swap(id,"sprite",1);
   exit;
		}
  
		in_button = dks_button_press(menu_sprite_manager);
	 if(in_button != -1)
	 {
   switch(in_button)
	  {
	   case 0 : 
	   var st_wid = string_width(text_question[question.FolderAdd][0] + " Folder name");
	   dks_question_input(450,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.FolderAdd,0]," Folder name");break;
	   case 1 :
	   if (current_tab !=-1)
	   {
	    if !ds_list_empty(sprite_tab)
	    { 
	     var st_wid = string_width(text_question[question.SpriteAdd][0]+" Sprite name");
	     dks_question_input(450,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.SpriteAdd,0],"Sprite name");
	    }
	    else
	    {
	     dks_message("No folders found! first of all, you must to add a folder structure ");
	    }
	   }
	   else
	   {
	    dks_message("You must to add a sprite into a folder, please select or create a folder first!");
	   }
	   break;
		  case 2: 
		  var st_wid = string_width(text_question[question.tree_import][0]+" Tree name");
		  dks_question_input(450,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.tree_import,0],"Tree name");
		  break;
       
		  case 3: 
		  var st_wid = string_width(text_question[question.tree_export][0]+" Tree name");
		  dks_question_input(450,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.tree_export,0],"Tree name");
		  break;
	  }
	  exit;
	 }   
 }   
}