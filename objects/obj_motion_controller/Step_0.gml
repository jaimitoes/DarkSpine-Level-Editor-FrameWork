///Updates, Managing our Tween Panel
Mxd = global.mouse_xd;
Myd = global.mouse_yd;
vcam = creator.vcam;
pcam = creator.pcam;
Dw = creator.Dw;
Dh = creator.Dh;
//Check if the input boxes are created for every parameter, The 2D array called "param" store on the column the current propertie and the values on the rows
if (!creator.input_created)
{
 var a;
 a[0] = param[current_set][2];
 a[1] = param[current_set][3];
 a[2] = param[current_set][4];
 a[3] = param[current_set][5];
 a[4] = param[current_set][6];
 a[5] = param[current_set][7];
 a[6] = param[current_set][8];
 a[7] = param[current_set][9];
 a[8] = param[current_set][10];
 a[9] = param[current_set][11];
 creator.input_list = dks_input_list_create(button_input_bar, a, show_arguments);
 creator.input_created = 1;
}
else
{
 //Check if the Deco creator is present in the editor, the motion controller is dependent of the creator object.
 if instance_exists(creator)
 {
  ///////////////////////////////////////////////////////////////////////	 
  #region Switching between nodes	 
  // Target Updater, every time we select a new target, we must to destroy the current ghosting parameters and get the id from the current Creator target.
  if (last_node != node_target)
  {
   if(input_node_created)
   {
    dks_input_list_destroy(node_input);
	dks_input_list_destroy(callstart_input);
	dks_input_list_destroy(callend_input);
	dks_input_list_destroy(callstop_input);
	callstart_input = -1;
	callend_input = -1;
	callstop_input = -1;
    button_callStart_info = 0;
	button_callEnd_info = 0;
	button_callStop_info = 0;
    input_node_created = 0;
   } 	  
   last_node = node_target;
  }
  if (target != creator.target)
  {
   if(creator.target = tween_node[0]) or (creator.target = tween_node[1])
   {
	node_target = creator.target;
   }
   else
   {
	if is_array(target.tweenS)
	{
	 if (creator.target.object_index = obj_tween_node)
	 {
	  node_target = creator.target;	 
	 }
	 else
	 {
	  instance_destroy(tween_node[0]);
	  instance_destroy(tween_node[1]);
	  instance_destroy(obj_tween_node);
	  tween_sequence = 0;
      node_target = noone;
      target = creator.target;
	 }
	}
	else
	{
     instance_destroy(tween_node[0]);
	 instance_destroy(tween_node[1]);
	 instance_destroy(obj_tween_node);
	 tween_sequence = 0;
     node_target = noone;
     target = creator.target;
	} 
   }
  }
  else
  {	  
   if (node_target != noone)
   {
    instance_destroy(tween_node[0]);
	instance_destroy(tween_node[1]);
	instance_destroy(obj_tween_node);
	tween_sequence = 0;
	node_target = noone;
   }
  }  
  #endregion
  ///////////////////////////////////////////////////////////////////////
  // One step checking, managing all the set of buttons
  if mouse_check_button_pressed(mb_left)
  {
   
    dks_set_offset(id,Mxd, Myd);
   	
   for (var i =0;i<12;i++)
   {
    par_xoffset[@i] = param[current_set][i];
   }
   dks_tweener_manage_key_active();
   dks_tweener_manage_key_player();
   dks_tweener_manage_key_destroy();
   dks_tweener_manage_key_type();
   dks_tweener_manage_key_plus();
   dks_tweener_manage_key_data();
  }
  // Check if an inputbox is active
  var active = dks_input_list_get_active(creator.input_list);
  
  if(active)
  {// The panel get all data from the input boxes
   if keyboard_check_released(vk_anykey)
   {
	var digits;   
	for(var i =0; i<10; i++)
	{
	 digits[i] = dks_input_get_text_real(creator.input_list[| i]);
	}
	   param[current_set][@2] =  digits[0];
    param[current_set][@3] =  digits[1];
    param[current_set][@4] =  digits[2];
    param[current_set][@5] =  digits[3];
    param[current_set][@6] =  digits[4];
    param[current_set][@7] =  digits[5];
    param[current_set][@8] =  digits[6];
    param[current_set][@9] =  digits[7];
    param[current_set][@10] = digits[8];
    param[current_set][@11] = digits[9];
    if (current_set = 6)
    {
	 // Blend colors need some extra data to set a Tween colouring a Deco Object
     param[current_set][@4] = make_color_hsv(param[current_set][6], param[current_set][7], param[current_set][8]);
     param[current_set][@5] = make_color_hsv(param[current_set][9], param[current_set][10], param[current_set][11]);
    }
   }
  }  
  else
  {// The panel get all data from the current panel settings
   if mouse_check_button(mb_left)
   {
	// Real time managing of the default Tween properties   
    dks_tweener_manage_prop();
	// Update the input boxes with the new values
    dks_input_set_text(creator.input_list[| 0],param[current_set][2]);
    dks_input_set_text(creator.input_list[| 1],param[current_set][3]);
    dks_input_set_text(creator.input_list[| 2],param[current_set][4]);
    dks_input_set_text(creator.input_list[| 3],param[current_set][5]);
    dks_input_set_text(creator.input_list[| 4],param[current_set][6]);
    dks_input_set_text(creator.input_list[| 5],param[current_set][7]);
    dks_input_set_text(creator.input_list[| 6],param[current_set][8]);
    dks_input_set_text(creator.input_list[| 7],param[current_set][9]);
    dks_input_set_text(creator.input_list[| 8],param[current_set][10]);
    dks_input_set_text(creator.input_list[| 9],param[current_set][11]);
   }
  }
  // If the ghosted object are not created, repeat the same process creating this as we have done in the create event.
  // Check the create event to see more info...
  if !instance_exists(tween_node[0])
  {
   // Check if our object is a parent and save the value	  
   var par = target.parent;
   // Unparenting our Deco object temporaly... 
   target.parent = 0;
   dks_object_copy(target);
   with(target)
   {
    other.tween_node[ 0] = dks_object_paste(x,y,object_index);
    other.tween_node[ 1] = dks_object_paste(x,y,object_index);
   } 
   
   tween_node[0].start_color = c_red;
   tween_node[1].start_color = c_lime;
   tween_node[0].Dmethod = tween_node[0].draw_method;
   tween_node[1].Dmethod = tween_node[1].draw_method;
   tween_node[0].draw_method = dks_draw_tween_node;
   tween_node[1].draw_method = dks_draw_tween_node;
   // Reset the previous value that contains the parent data information
   target.parent = par;
   ////////////////////////////////////////////////////////////////////
   if is_array(target.tweenS)
   {
	dks_object_copy(target);  
	with(target)
	{
	 var s = array_length(tweenS);
	 for (var i =0; i<s; i++)
	 {
	  ////Transformation data	 
	  other.tween_sequence[i] = dks_object_paste(tweenS[i][0],tweenS[i][1],obj_tween_node);  
	  other.tween_sequence[i].start_color = c_orange;
	  other.tween_sequence[i].Dmethod = draw_method;
      other.tween_sequence[i].draw_method = dks_draw_tween_node;
	  other.tween_sequence[i].image_xscale = tweenS[i][2];
	  other.tween_sequence[i].image_yscale = tweenS[i][3];
	  other.tween_sequence[i].image_angle = tweenS[i][4];
	  other.tween_sequence[i].image_alpha = tweenS[i][5];
	  other.tween_sequence[i].image_blend = tweenS[i][6];
	  other.tween_sequence[i].depth = tweenS[i][7];
	  other.tween_sequence[i].x_rotation = tweenS[i][8];
	  other.tween_sequence[i].y_rotation = tweenS[i][9];
	  //////Timeline Data/////////////////////////////////////////
	  other.tween_sequence[i].ease = tweenD[i][0];
	  other.tween_sequence[i].delay = tweenD[i][1];
	  other.tween_sequence[i].duration = tweenD[i][2];
	  other.tween_sequence[i].callstart = tweenD[i][3];
	  other.tween_sequence[i].callend = tweenD[i][4];
	  other.tween_sequence[i].callstop = tweenD[i][5];
	  //////CallBack Data///////////////////////////////////////
	  if is_array(tweenCst)
	  {
	   var ss = array_length(tweenCst[i]);
	   if (ss > 0)
	   {
		for(var j = 0; j<ss;j++)
		{
		 other.tween_sequence[i].callstart_arg[j] = tweenCst[i][j];
		}
	   }
	  }
	  if is_array(tweenCed)
	  {
	   var ss = array_length(tweenCed[i]);
	   if (ss > 0)
	   {
		for(var j = 0; j<ss;j++)
		{
		 other.tween_sequence[i].callend_arg[j] = tweenCed[i][j];
		}
	   }
	  }	  
	  if is_array(tweenCstop)
	  {
	   	var ss = array_length(tweenCstop[i]);
	   if (ss > 0)
	   {
		for(var j = 0; j<ss;j++)
		{
		 other.tween_sequence[i].callstop_arg[j] = tweenCstop[i][j];
		}
	   }  
	  }
	  ////////////////////////////////////////////////////////////////////
	 }
	} 
	dks_set_offset(obj_tween_node,global.mouse_xd,global.mouse_yd);
   }
  }
 }
 //Check if a slot is activated to be able to insert the data property to a Deco object, setting up a representation simbol and color 
 for(var i=0;i<10;i++)
 {
  if (k_set[i])
  {
   dks_button_add_text(key_set, i, "O");
   dks_button_add_colour(key_set, i, lime_pastel, dark_gray, dark_gray, lime_pastel);
  }
  else
  {
   dks_button_add_text(key_set, i, "U");
   dks_button_add_colour(key_set, i, node_color, dark_gray, dark_gray, node_color);
  }

  if (i = current_set)
  {
   dks_button_add_colour(key_type, i, lime_pastel,dark_gray,dark_gray,lime_pastel);
  } 
  else
  {
   dks_button_add_colour(key_type, i, orange_pastel,dark_gray, dark_gray, orange_pastel);
  }
 }
 // Set the colours of the slot destroy buttons depending if our Deco objects already contains a Tween
 if (target.have_tween)
 {
  for (var j =0; j<10; j++)
  {
   if (target.tween[j] !=-1)
   {
    dks_button_add_colour(key_dest, j, lime_pastel, dark_gray,dark_gray,lime_pastel);
   }
   else
   {
    dks_button_add_colour(key_dest, j, red_pastel,dark_gray,dark_gray,red_pastel);
   }
  }
 }
 else
 {
  //Set the default colour to a activator slot while this one is deactivated.
  dks_button_set_colour(key_dest, red_pastel,dark_gray,dark_gray,red_pastel);
 }
 // Highliting the colour bars buttons to set customized tween colours for your Deco Object
 if(current_set = 6)
 {
  //draw_sprite_ext(spr_hsv,0,bar[4,0],bar[4,1],1,1,0,param[6,4],1);
  dks_button_add_colour(bar,4,param[6][4],param[6][4],c_white,c_white);
  dks_button_add_colour(bar,5,param[6][5],param[6][5],c_white,c_white);
  with(creator)
  {// Set the same colors for the input boxes responsible to manage the Deco blending
   for(var i =2;i<10;i++)
   {
    input_list[| i].font_color = c_white;
    input_list[| i].cursor_text_col = c_white;
   }
  }
 }
 else
 {
  // If you manage a property other.id than insert colors, we assign the default colors to our analog buttons
  dks_button_add_colour(bar,4,orange_pastel,orange_pastel,dark_gray,dark_gray);
  dks_button_add_colour(bar,5,orange_pastel,orange_pastel,dark_gray,dark_gray);
  // Set the sames colors for the input boxes
  with(creator)
  {
   for(var i =2;i<10;i++)
   {
    input_list[| i].font_color = dark_gray;
    input_list[| i].cursor_text_col = orange_pastel;
   }
  }
 }
 // Update the current ease equation text settings 
 dks_button_add_text(bar, 0, "               Ease: "+script_get_name(param[current_set][0]));  
 switch(param[current_set][1])
 {
  case 0 : dks_button_add_text(bar, 1,"            Mode: TWEEN_MODE_ONCE");break;
  case 1 : dks_button_add_text(bar, 1,"            Mode: TWEEN_MODE_BOUNCE");break;
  case 2 : dks_button_add_text(bar, 1,"            Mode: TWEEN_MODE_PATROL");break;
  case 3 : dks_button_add_text(bar, 1,"            Mode: TWEEN_MODE_LOOP");break;
  case 4 : dks_button_add_text(bar, 1,"            Mode: TWEEN_MODE_REPEAT");break;
 } 
}
// If the tween ghost system is active but you don´t select any ghosted node, this nodes are updated with the panel setters values.
if(node_target = noone)
{
 if  (k_play[0]) or  (k_play[4])
 {
  // If a tween ghosted node are not selected, the tween nodes gets the data from the tween panel.
  // First gosthed node	 
  tween_node[ 0].x = target.x+param[0][4];
  tween_node[ 0].y = target.y+param[1][4];
  tween_node[ 0].image_xscale = target.image_xscale +param[2][4];
  tween_node[ 0].image_yscale = target.image_yscale +param[3][4]; 
  tween_node[ 0].image_angle = target.image_angle + param[4][4];
  tween_node[ 0].image_alpha = target.image_alpha + param[5][4];
  tween_node[ 0].depth = target.depth + param[7][4];
  tween_node[ 0].x_rotation = target.x_rotation + param[8][4];
  tween_node[ 0].y_rotation = target.y_rotation + param[9][4];
  //Second gosthed node
  tween_node[ 1].x = target.x+param[0][5];
  tween_node[ 1].y = target.y+param[1][5];
  tween_node[ 1].image_xscale = target.image_xscale +param[2][5];
  tween_node[ 1].image_yscale = target.image_yscale +param[3][5];
  tween_node[ 1].image_angle = target.image_angle + param[4][5];
  tween_node[ 1].image_alpha = target.image_alpha + param[5][5];
  tween_node[ 1].depth = target.depth + param[7,5];
  tween_node[ 1].x_rotation = target.x_rotation + param[8][5];
  tween_node[ 1].y_rotation = target.y_rotation + param[9][5];
 }
}  
else
{
 // If a tween ghosted node is selected, our tween panel gets the data from this.
 // First gosthed node
 param[0][@4] = tween_node[ 0].x - target.x;
 param[1][@4] = tween_node[ 0].y - target.y;
 param[2][@4] = tween_node[ 0].image_xscale - target.image_xscale;
 param[3][@4] = tween_node[ 0].image_yscale - target.image_yscale;
 param[4][@4] = tween_node[ 0].image_angle  - target.image_angle;
 param[5][@4] = tween_node[ 0].image_alpha  - target.image_alpha;
 param[7][@4] = tween_node[ 0].depth  - target.depth;
 param[8][@4] = tween_node[ 0].x_rotation  - target.x_rotation;
 param[9][@4] = tween_node[ 0].y_rotation - target.y_rotation;
 //Second gosthed node
 param[0][@5] = tween_node[ 1].x - target.x;
 param[1][@5] = tween_node[ 1].y - target.y;
 param[2][@5] = tween_node[ 1].image_xscale - target.image_xscale;
 param[3][@5] = tween_node[ 1].image_yscale - target.image_yscale;
 param[4][@5] = tween_node[ 1].image_angle  - target.image_angle;
 param[5][@5] = tween_node[ 1].image_alpha  - target.image_alpha;
 param[7][@5] = tween_node[ 1].depth  - target.depth;
 param[8][@5] = tween_node[ 1].x_rotation  - target.x_rotation;
 param[9][@5] = tween_node[ 1].y_rotation  - target.y_rotation;
 //////////////////////////////////////////////////////////////////
 if instance_exists(obj_tween_node) and (node_target.object_index = obj_tween_node)
 {
  if (!input_node_created)
  {
   var txt;
   txt[0] = node_target.ease;
   txt[1] = node_target.delay;
   txt[2] = node_target.duration;
   txt[3] = node_target.callstart;
   txt[4] = node_target.callend;
   txt[5] = node_target.callstop;
   node_input = dks_input_list_create(button_sequence_input, txt, 1);
   input_node_created = true;
   //////////////////////////////////////////////////////////////////////////////////////////////////
   if is_array(node_target.callstart_arg)
   {
	dks_callstart_button_create();
   }
   
   if is_array(node_target.callend_arg)
   {
	dks_callend_button_create();
   }
   
   if is_array(node_target.callstop_arg)
   {
	dks_callstop_button_create();   
   }
   //////////////////////////////////////////////////////////////////////////////
  }
  else
  {
   if mouse_check_button_released(mb_left)
   {
    var press = dks_button_press(button_sequence_input);
    if (press = 0)
    {
	 var t = asset_get_index(node_target.ease);    
	 var s = array_length(ease);
	 for(var i = 0; i<s; i++)
	 {
	  if (t == ease[i])
	  {
	   if (i != s-1)
	   {
		t = script_get_name(ease[i+1]);
		node_target.ease = t;
		dks_input_set_text(node_input[| 0], t);
		break;   
	   }
	   else
	   {
		t = script_get_name(ease[0]);    
		node_target.ease = t;
		dks_input_set_text(node_input[| 0], t);
		break;   
	   }
	  }
	 }
    }
	press = dks_button_press(button_argument_add)
	if (press >-1)
	{
	 switch(press)
	 {
	  case 0:
	  ////////////////////delete callback start column//////////////////////////
	  var p = dks_button_press(button_argument_del);
	  if  (p = 0)
	  {
	   if is_array(button_callStart_info)
	   {
		button_callStart_info = 0;
		node_target.callstart_arg = 0;
		node_target.callstart = "null";
		dks_input_list_destroy(callstart_input);
		callstart_input = -1;
		target.tweenCst = 0;
		dks_input_set_text(node_input[| 3],"null");
		dks_message("Column deleted");
	   }
	   else
	   {
		dks_message("Nothing to delete");   
	   }
	   break;
	  }
	  ////////////////copy callback start column ////////////////////////////
	  p = dks_button_press(button_column_copy);
	  if(p = 0)
	  {
	   if is_array(node_target.callstart_arg)
	   {
	    column_copy = 0;
	    column_copy = dks_array_copy(node_target.callstart_arg);
		script_copy = node_target.callstart;
		dks_message("Column CallBackStart copied");
	   }
	   else
	   {
		dks_message("nothing to copy");  
	   }
	   break;
	  } 
	  ////////////// paste callback start column////////////////////////////
	  p = dks_button_press(button_column_paste);
	  if(p = 0)
	  {
	   if is_array(column_copy)
	   {
	    button_callStart_info = 0;
		node_target.callstart_arg = 0;
		dks_input_list_destroy(callstart_input);
		callstart_input = -1;
		target.tweenCst = 0;
		node_target.callstart_arg = dks_array_copy(column_copy);
		node_target.callstart = script_copy;
		dks_input_set_text(node_input[| 3],script_copy);
		dks_callstart_button_create();
		
		dks_message("Column inserted");
	   }
	   else
	   {
		dks_message("nothing to paste");   
	   }
	   break;
	  }
	  //////////////////////add arguments into callback start script of each node /////////////////////////////
      
	   if is_array(button_callStart_info)
	   {
	    var s = array_length(button_callStart_info);
	    button_callStart_info = dks_button_add_reel(button_callStart_info, "down", 128, 24, 40, 12, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel,spr_button_256);
	    button_callStart_input = dks_button_add_reel(button_callStart_input, "down", 128, 24, 0, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel,spr_button_256);
	    dks_button_add_text(button_callStart_info, s, "argument"+string(s));
	    node_target.callstart_arg[s] = "null";
	    callstart_input[| s] = dks_input_create(button_callStart_input, s, 0,0, "null", fontGGUI);
	   }
	   else
	   {
	    button_callStart_info = dks_button_create(390, 30, 128, 24, 40, 12, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);	
	    button_callStart_input = dks_button_create(490, 30, 128, 24, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);	
	    dks_button_add_text(button_callStart_info, 0, "argument"+string(0));
	    node_target.callstart_arg[0] = "null";
	    callstart_input = ds_list_create();
	    callstart_input[| 0] = dks_input_create(button_callStart_input, 0, 0,0, "null", fontGGUI);
	    
	    }
	   	
	  break;
	  case 1:
	  //////////////////delete callback end column/////////
	  var p = dks_button_press(button_argument_del);
	  if  (p = 1)
	  {
	   if is_array(button_callEnd_info)
	   {
		button_callEnd_info = 0;
		node_target.callend_arg = 0;
		node_target.callend = "null";
		dks_input_list_destroy(callend_input);
		callend_input = -1;
		target.tweenCed = 0;
		dks_input_set_text(node_input[| 4],"null");
		dks_message("Column deleted");
	   }
	   else
	   {
		dks_message("Nothing to delete");   
	   }
	   break;
	  }
	  ////////////////copy callback end column ////////////////////////////
	  p = dks_button_press(button_column_copy);
	  if(p = 1)
	  {
	   if is_array(node_target.callend_arg)
	   {
		   
	    column_copy = 0;
	    column_copy = dks_array_copy(node_target.callend_arg);
		script_copy = node_target.callend;
		dks_message("Column CallbackEnd copied");
	   }
	   else
	   {
		dks_message("nothing to copy");  
	   }
	   break;
	  } 
	  ////////////// paste callback start column////////////////////////////
	  p = dks_button_press(button_column_paste);
	  if(p = 1)
	  {
	   if is_array(column_copy)
	   {
	    button_callEnd_info = 0;
		node_target.callend_arg = 0;
		dks_input_list_destroy(callend_input);
		callend_input = -1;
		target.tweenCed = 0;
		node_target.callend_arg = dks_array_copy(column_copy);
		node_target.callend = script_copy;
		dks_input_set_text(node_input[| 4],script_copy);
		dks_callend_button_create();
		dks_message("Column inserted");
	   }
	   else
	   {
		dks_message("nothing to paste");   
	   }
	   break;
	  }
	  /////////////////////////////////////////////////////////////////////
	  
	   if is_array(button_callEnd_info)
	   {
	    var s = array_length(button_callEnd_info);
	    button_callEnd_info = dks_button_add_reel(button_callEnd_info, "down", 128,24, 40,12,0,lime_pastel,lime_pastel,dark_gray,lime_pastel,spr_button_256);
	    button_callEnd_input = dks_button_add_reel(button_callEnd_input, "down", 128, 24, 0, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel,spr_button_256);
	    dks_button_add_text(button_callEnd_info, s, "argument"+string(s));
	    node_target.callend_arg[s] = "null";
	    callend_input[| s] = dks_input_create(button_callEnd_input, s, 0,0, "null", fontGGUI);
	   }
	   else
	   {
	    button_callEnd_info = dks_button_create( 390+258, 30 ,128, 24, 40, 12, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	    button_callEnd_input = dks_button_create(490+258, 30, 128, 24, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);	
	    dks_button_add_text(button_callEnd_info, 0, "argument"+string(0));
	    node_target.callend_arg[0] = "null";
	    callend_input = ds_list_create();
	    callend_input[| 0] = dks_input_create(button_callEnd_input, 0, 0,0, "null", fontGGUI);
	   }
	  break;
	  case 2:
	  //////////////////delete callback end column/////////
	  var p = dks_button_press(button_argument_del);
	  if  (p = 2)
	  {
	   if is_array(button_callStop_info)
	   {
		button_callStop_info = 0;
		node_target.callstop_arg = 0;
		node_target.callstop = "null";
		dks_input_list_destroy(callstop_input);
		callstop_input = -1;
		target.tweenCstop = 0;
		dks_input_set_text(node_input[| 5],"null");
		dks_message("Column deleted");
	   }
	   else
	   {
		dks_message("Nothing to delete");   
	   }
	   break;
	  }
	  ////////////////copy callback end column ////////////////////////////
	  p = dks_button_press(button_column_copy);
	  if(p = 2)
	  {
	   if is_array(node_target.callstop_arg)
	   {
		   
	    column_copy = 0;
	    column_copy = dks_array_copy(node_target.callstop_arg);
		script_copy = node_target.callstop;
		dks_message("Column CallbackStop copied");
	   }
	   else
	   {
		dks_message("nothing to copy");  
	   }
	   break;
	  } 
	  ////////////// paste callback start column////////////////////////////
	  p = dks_button_press(button_column_paste);
	  if(p = 2)
	  {
	   if is_array(column_copy)
	   {
	    button_callStop_info = 0;
		node_target.callstop_arg = 0;
		dks_input_list_destroy(callstop_input);
		callstop_input = -1;
		target.tweenCstop = 0;
		node_target.callstop_arg = dks_array_copy(column_copy);
		node_target.callstop = script_copy;
		dks_input_set_text(node_input[| 5],script_copy);
		dks_callstop_button_create();
		dks_message("Column inserted");
	   }
	   else
	   {
		dks_message("nothing to paste");   
	   }
	   break;
	  }
	  /////////////////////////////////////////////////////////////////////
	  
	   if is_array(button_callStop_info)
	   {
	    var s = array_length(button_callStop_info);
	    button_callStop_info = dks_button_add_reel(button_callStop_info, "down", 128,24, 40,12,0,lime_pastel,lime_pastel,dark_gray,lime_pastel,spr_button_256);
	    button_callStop_input = dks_button_add_reel(button_callStop_input, "down", 128, 24, 0, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel,spr_button_256);
	    dks_button_add_text(button_callStop_info, s, "argument"+string(s));
	    node_target.callstop_arg[s] = "null";
	    callstop_input[| s] = dks_input_create(button_callStop_input, s, 0,0, "null", fontGGUI);
	   }
	   else
	   {
	    button_callStop_info = dks_button_create( 390+516, 30 ,128, 24, 40, 12, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);
	    button_callStop_input = dks_button_create(490+516, 30, 128, 24, 0, 0, lime_pastel, lime_pastel, dark_gray, lime_pastel, spr_button_256);	
	    dks_button_add_text(button_callStop_info, 0, "argument"+string(0));
	    node_target.callstop_arg[0] = "null";
	    callstop_input = ds_list_create();
	    callstop_input[| 0] = dks_input_create(button_callStop_input, 0, 0,0, "null", fontGGUI);
	   }
	  
	 }
    }
   }	
   if keyboard_check_released(vk_anykey)
   {
	//node_target.ease = dks_input_get_text(node_input[| 0]);
	node_target.delay = dks_input_get_text_real(node_input[| 1]);
	node_target.duration = dks_input_get_text_real(node_input[| 2]);
	node_target.callstart = dks_input_get_text(node_input[| 3]);
	node_target.callend = dks_input_get_text(node_input[| 4]);
	node_target.callstop = dks_input_get_text(node_input[| 5]);
	//////////////////////////////////////////////////////////////////////////
	if ds_exists(callstart_input,ds_type_list)
	{
	 var s = ds_list_size(callstart_input);
	 for (var i =0; i<s; i++)
	 {
	  node_target.callstart_arg[i] = dks_input_get_text(callstart_input[| i]);	 
	 }
	}
	
	if ds_exists(callend_input,ds_type_list)
	{
	 var s = ds_list_size(callend_input);
	 for (var i =0; i<s; i++)
	 {
	  node_target.callend_arg[i] = dks_input_get_text(callend_input[| i]);	 
	 }
	}
	
	if ds_exists(callstop_input,ds_type_list)
	{
	 var s = ds_list_size(callstop_input);
	 for (var i =0; i<s; i++)
	 {
	  node_target.callstop_arg[i] = dks_input_get_text(callstop_input[| i]);	 
	 }
	}
	///////////////////////////////////////////////////////////////////////////
   }
   else
   {
	if keyboard_check_pressed(vk_delete)
	{
     dks_sequence_node_delete(target, node_target);
	 if(input_node_created)
     {
      dks_input_list_destroy(node_input);
      input_node_created = 0;
	  ///////////////////////
	  dks_input_list_destroy(callstart_input);
	  dks_input_list_destroy(callend_input);
	  dks_input_list_destroy(callstop_input);
	  callstart_input = -1;
	  callend_input = -1;
	  callstop_input = -1;
	  button_callStart_info = 0;
	  button_callEnd_info = 0;
	  button_callStop_info = 0;
	  ///////////////////////
     } 
	 exit;		
	}
	var s = array_length(tween_sequence);
	for(var i = 0; i<s; i++)
	{
	 // Transformation Data	
	 target.tweenS[i][@0] = tween_sequence[i].x;
	 target.tweenS[i][@1] = tween_sequence[i].y;
	 target.tweenS[i][@2] = tween_sequence[i].image_xscale;
	 target.tweenS[i][@3] = tween_sequence[i].image_yscale;
	 target.tweenS[i][@4] = tween_sequence[i].image_angle;
	 target.tweenS[i][@5] = tween_sequence[i].image_alpha;
	 target.tweenS[i][@6] = tween_sequence[i].image_blend;
	 target.tweenS[i][@7] = tween_sequence[i].depth;
	 target.tweenS[i][@8] = tween_sequence[i].x_rotation;
	 target.tweenS[i][@9] = tween_sequence[i].y_rotation;
	 // Timeline data
  target.tweenD[i][@0] = tween_sequence[i].ease;
	 target.tweenD[i][@1] = tween_sequence[i].delay;
	 target.tweenD[i][@2] = tween_sequence[i].duration;
	 target.tweenD[i][@3] = tween_sequence[i].callstart;
	 target.tweenD[i][@4] = tween_sequence[i].callend;
	 target.tweenD[i][@5] = tween_sequence[i].callstop;
	 
	 if is_array(tween_sequence[i].callstart_arg)
	 {
	  if (!is_array(target.tweenCst))
	  {
	   target.tweenCst[i][0] = 0;	  
	  }
	  var ss = array_length(tween_sequence[i].callstart_arg);
	  for (var j=0; j<ss;j++)
	  {
	   target.tweenCst[i][@j] = tween_sequence[i].callstart_arg[j]; 	  
	  }
	 }
	 
	 if is_array(tween_sequence[i].callend_arg)
	 {
      if (!is_array(target.tweenCed))
	  {
	   target.tweenCed[i][0] = 0;	  
	  }		 
	  var ss = array_length(tween_sequence[i].callend_arg);
	  for (var j=0; j<ss;j++)
	  {
	   target.tweenCed[i][@j] = tween_sequence[i].callend_arg[j]; 	  
	  }
	 }
	 
	 if is_array(tween_sequence[i].callstop_arg)
	 {
      if (!is_array(target.tweenCstop))
	  {
	   target.tweenCstop[i][0] = 0;	  
	  }		 
	  var ss = array_length(tween_sequence[i].callstop_arg);
	  for (var j=0; j<ss;j++)
	  {
	   target.tweenCstop[i][@j] = tween_sequence[i].callstop_arg[j]; 	  
	  }
	 }
	 
	}
   }
  }
 }
 else
 {
  if(input_node_created)
  {
   dks_input_list_destroy(node_input);
   dks_input_list_destroy(callstart_input);
   dks_input_list_destroy(callend_input);
   dks_input_list_destroy(callstop_input);
   callstart_input = -1;
   callend_input = -1;
   callstop_input = -1;
   input_node_created = 0;
   button_callStart_info = 0;
   button_callEnd_info = 0;
   button_callStop_info = 0;
  } 
 }
 
 if keyboard_check(vk_control)
 {
  if (node_target != tween_node[ 0])
  {	 
   if keyboard_check_pressed(ord("C"))
   {
    dks_object_copy(node_target);  
	dks_message("Node copied");
   }
   
   if keyboard_check_pressed(ord("V"))
   {
	if is_array(tween_sequence)
    {
	 var s = array_length(other.tween_sequence);	
	 with(node_target)
	 {
      other.tween_sequence[s] = dks_object_paste( other.Mxd, other.Myd,obj_tween_node);
	 } 
	 tween_sequence[s].start_color = c_orange;
	 tween_sequence[s].Dmethod = target.draw_method;
     tween_sequence[s].draw_method = dks_draw_tween_node;
	 target.tweenS[s][0] = tween_sequence[s].x;
	 target.tweenS[s][1] = tween_sequence[s].y;
	 target.tweenS[s][2] = tween_sequence[s].image_xscale;
	 target.tweenS[s][3] = tween_sequence[s].image_yscale;
	 target.tweenS[s][4] = tween_sequence[s].image_angle;
	 target.tweenS[s][5] = tween_sequence[s].image_alpha;
	 target.tweenS[s][6] = tween_sequence[s].image_blend;
	 target.tweenS[s][7] = tween_sequence[s].depth;
	 target.tweenS[s][8] = tween_sequence[s].x_rotation;
	 target.tweenS[s][9] = tween_sequence[s].y_rotation;
	 //////////////////////////////////////////////////
	 target.tweenD[s][0] = tween_sequence[s].ease;
	 target.tweenD[s][1] = tween_sequence[s].delay;
	 target.tweenD[s][2] = tween_sequence[s].duration;
	 target.tweenD[s][3] = tween_sequence[s].callstart;
	 target.tweenD[s][4] = tween_sequence[s].callend;
	 target.tweenD[s][5] = tween_sequence[s].callstop;
	 ////////////////////////////////////////////////////
	 
	}
    else
    {
	 with(node_target)
     {   
	  other.tween_sequence[0] = dks_object_paste( other.Mxd, other.Myd,obj_tween_node);
	 } 
	 tween_sequence[0].start_color = c_orange;
	 tween_sequence[0].Dmethod = target.draw_method;
     tween_sequence[0].draw_method = dks_draw_tween_node;
	 target.tweenS[0][0] = tween_sequence[0].x;
	 target.tweenS[0][1] = tween_sequence[0].y;
	 target.tweenS[0][2] = tween_sequence[0].image_xscale;
	 target.tweenS[0][3] = tween_sequence[0].image_yscale;
	 target.tweenS[0][4] = tween_sequence[0].image_angle;
	 target.tweenS[0][5] = tween_sequence[0].image_alpha;
	 target.tweenS[0][6] = tween_sequence[0].image_blend;
	 target.tweenS[0][7] = tween_sequence[0].depth;
	 target.tweenS[0][8] = tween_sequence[0].x_rotation;
	 target.tweenS[0][9] = tween_sequence[0].y_rotation;
	 ///////////////////////////////////////////////////
	 target.tweenD[0][0] = tween_sequence[0].ease;
	 target.tweenD[0][1] = tween_sequence[0].delay;
	 target.tweenD[0][2] = tween_sequence[0].duration;
	 target.tweenD[0][3] = tween_sequence[0].callstart;
	 target.tweenD[0][4] = tween_sequence[0].callend;
	 target.tweenD[0][5] = tween_sequence[0].callstop;
	 //////////////////////////////////////////////////////
	 
    }
   }
  } 
 }
}