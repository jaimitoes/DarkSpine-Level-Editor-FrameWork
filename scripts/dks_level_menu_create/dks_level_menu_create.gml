/// @description dks_level_menu_create
function dks_level_menu_create() 
{
	if ! ds_list_empty(level_list)
	{
	 // Reset the level menu variables	
	 menu_b_level_select = 0;
	 menu_b_level_del = 0;
	 // When the level list contains more than 24 rows, we start drawing in the next column
	 var row = 23;
	 // Get how many levels are stored and creates the button reel
	 var size = ds_list_size(level_list);
	 menu_b_level_select = dks_button_create( 129, 96, 256, 24, 128, 14, dark_gray,node_color,node_color,dark_gray,spr_button_256);
	 dks_button_add_text(menu_b_level_select,0,level_list[| 0]);
	 menu_b_level_del = dks_button_create( 129+257, 96, 32, 24, 16, 12, dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	 dks_button_add_text(menu_b_level_select,0,level_list[| 0]);
	 dks_button_add_text(menu_b_level_del,0,"X");
 
	 if (size >1)
	 { 
	  for (var i =1;i<size;i++)
	  {
	   if(row != 0)
	   {
	    menu_b_level_select = dks_button_add_reel(menu_b_level_select,"down",256, 24, 128, 14, 2, dark_gray,node_color,node_color,dark_gray,spr_button_256);
	    menu_b_level_del = dks_button_add_reel(menu_b_level_del,"down",32, 24, 16, 12, 2, dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	    dks_button_add_text(menu_b_level_select,i,level_list[| i]);
	    dks_button_add_text(menu_b_level_del,i,"X");
	    row -=1;
	   }
	   else
	   {
	    // Create the buttons in the next column	  
	    menu_b_level_select = dks_button_add_reel(menu_b_level_select,"right",256, 24, 128, 14, 2, dark_gray,node_color,node_color,dark_gray,spr_button_256);
	    menu_b_level_del = dks_button_add_reel(menu_b_level_del,"right",32, 24, 16, 12, 2, dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
   
	    menu_b_level_select[i][@0] +=32;
	    menu_b_level_select[i][@2] +=32;
	    menu_b_level_select[i][@1] = menu_b_level_select[0][1];
	    menu_b_level_select[i][@3] = menu_b_level_select[0][3];
    
	    menu_b_level_del[i][@0] += 256;
	    menu_b_level_del[i][@2] += 256;
	    menu_b_level_del[i][@1] = menu_b_level_select[0][1];
	    menu_b_level_del[i][@3] = menu_b_level_select[0][3];
   
	    menu_b_level_select[i][@12] +=32;
	    menu_b_level_select[i][@13] = menu_b_level_select[0][1]+12;
   
	    menu_b_level_del[i][@12] += 256;
	    menu_b_level_del[i][@13] = menu_b_level_del[0][1]+12;;
   
   
	    dks_button_add_text(menu_b_level_select, i,level_list[| i]);
	    dks_button_add_text(menu_b_level_del, i,"X");
   
	    row = 24;
	   }
	  }
	 }
	 // Set the panel to draw the level menu
	 menu_setters = setter.level;
	}
	else
	{
	 dks_message("Warning! : no levels found, add an object in the world and press <QUICK SAVE>");
	}
}