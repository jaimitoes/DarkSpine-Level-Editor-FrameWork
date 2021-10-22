function dks_setter_layer() 
{
	if mouse_check_button_pressed(mb_left)
	{
	  var press;
  
	  press = dks_button_press(button_layer_add);
	   if(press > -1)
	   {
	    var st_wid = string_width(text_question[question.LayerAdd][0]+" String name here...");
	    if(modo = mode.edit)
	    {
     
	     dks_question_input(580,64,st_wid,256,dark_gray,orange_pastel,orange_pastel,dark_gray,text_question[question.LayerAdd][0]," String name here...");exit;
	    }
	    else
	    {
	     dks_question_input(580,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.LayerAdd][0],"String name here...");exit;
	    }
	   }
   
	   press = dks_button_press(button_layer_lock);
	   if(press > -1)
	   {
	    dks_layer_lock(press);exit;
	   }
   
	   press = dks_button_press(button_layer_depth);
	   if(press > -1)
	   {
	    last_input = press;
	    var st_wid = string_width(text_question[question.LayerInput][0]+ " Real number here...");
	    if(modo = mode.edit)
	    {
	     dks_question_input(580,64,st_wid,256,dark_gray,orange_pastel,orange_pastel,dark_gray,text_question[question.LayerInput][0],"Real number here...");exit;
	    }
	    else
	    {
	     dks_question_input(580,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.LayerInput][0],"Real number here...");exit;
	    } 
	   }
   
	   press = dks_button_press(button_layer_select);
	   if(press > -1)
	   {
	    dks_layer_select(press);exit;
    
	   }
   
	   press = dks_button_press(button_layer_view);
	   if(press > -1)
	   {
	    dks_layer_view(press);exit;
	   }
   
	   press = dks_button_press(button_layer_delete);
	   if(press > -1)
	   {
	    last_input = press;
	    var st_wid = string_width(text_question[question.LayerDel][0]+ " ["+layer_index[press][0]+"]");
	    dks_question(580,64,st_wid,256,dark_gray,node_color,node_color,dark_gray,text_question[question.LayerDel][0]," ["+layer_index[press][0]+"]");exit;
	   }
	}    

	////////////////////////////////////////

	if mouse_check_button_pressed(mb_right)
	{
	 var press = dks_button_press(button_layer_select);
	 if (press >-1)
	 {
	  layer_reorder = press;
	 }
	 else
	 {
	  layer_reorder = -1;
	 }
	}

	if mouse_check_button_released(mb_right)
	{
	 if(layer_reorder != -1)
	 {
	  var press = dks_button_press(button_layer_select);
	  if (press >-1)
	  {
	   if (layer_reorder != press)
	   {
	    var name, dp, eye, lok;
	    name = layer_index[layer_reorder][0];
	    dp = layer_index[layer_reorder][1];
	    eye = layer_index[layer_reorder][2];
	    lok = layer_index[layer_reorder][3];
	    layer_index[layer_reorder][@0] = layer_index[ press][0];
	    layer_index[layer_reorder][@1] = layer_index[ press][1];
	    layer_index[layer_reorder][@2] = layer_index[ press][2];
	    layer_index[layer_reorder][@3] = layer_index[ press][3];
	    dks_button_add_text(button_layer_select,layer_reorder, layer_index[ press][0]);
	    dks_button_add_text(button_layer_depth, layer_reorder, layer_index[ press][1]);
	    layer_index[press][@0] = name;
	    layer_index[press][@1] = dp;
	    layer_index[press][@2] = eye;
	    layer_index[press][@3] = lok;
	    dks_button_add_text(button_layer_select, press, name);
	    dks_button_add_text(button_layer_depth,  press, dp);
	   }
	   else
	   {
	    layer_reorder = -1;
	   }
	  }
	  else
	  {
	   layer_reorder = -1;
	  }
	 }
	}  
}