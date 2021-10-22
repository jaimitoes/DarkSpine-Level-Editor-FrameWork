function dks_setter_variable() 
{
	if(target !=noone)
	{
	 if is_array(target.variables)
	 {
	  if (!input_created)
   {
	   button_variables_info = 0;
	   button_variables_int  = 0;
	   input_list = dks_input_list_create(button_variables_int, target.variables,1);
	   var s = array_length(target.variables);
	   var info = target.object_transform;
	   if(info !=noone)
	   {
     if ds_map_exists(obj_editor_control.var_map, info)
	    {
	     var l = obj_editor_control.var_map[? info];
	     var size = ds_list_size(l);
	     button_variables_info = dks_button_reel_create("down",size,128,64,128,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
	     for (var i =0; i<size; i++)
	     {
	      dks_button_add_text(button_variables_info, i, l[| i]);
	     }
     
	     button_variables_int  =  dks_button_reel_create("down",s,256,64,256,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
	     input_list = dks_input_list_create(button_variables_int, target.variables,1);
	     input_created = true;
	     exit;
	    }
	   }
	   button_variables_info = dks_button_reel_create("down",s,128,64,128,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
	   for (var i =0; i<s; i++)
	   {
	    dks_button_add_text(button_variables_info, i, "variable "+ string(i));
	   }
    button_variables_int  =  dks_button_reel_create("down",s,256,64,256,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
	   input_list = dks_input_list_create(button_variables_int, target.variables,1);
	   input_created = true;
   }
	  else
	  {
	   if mouse_check_button_released(mb_any) or keyboard_check_released(vk_anykey)
	   {
	    var active = dks_input_list_get_active(input_list);
	    if(active)
	    {
	     target.variables =0;
	     target.variables = dks_input_list_get_text(input_list);
     }
	   } 
	  }
	 }

	 if mouse_check_button_pressed(mb_left)
		{
		 var press = dks_button_press(button_variables_create);
		 if (press !=-1)
		 {
		  switch(press)
		  {
		   case 0: 
		   if is_array(target.variables)
		   {
		    dks_input_list_destroy(input_list);
			   input_created = 0;
		    button_variables_info = 0;
		    button_variables_int  = 0;
		    var s = array_length(target.variables);
		    target.variables[@ s] = 0;
		    s = array_length(target.variables);
      var info = target.object_transform;
		    if(info !=noone)
		    {
		     if ds_map_exists(obj_editor_control.var_map, info)
		     {
		      var l = obj_editor_control.var_map[? info];
		      var size = ds_list_size(l);
		      button_variables_info = dks_button_reel_create("down",size,128,64,256,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
		      for (var i =0; i<size; i++)
		      {
		       dks_button_add_text(button_variables_info, i, l[| i]);
		      }
        button_variables_int  =  dks_button_reel_create("down",s,256,64,128,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
		      input_list = dks_input_list_create(button_variables_int, target.variables,1);
		      input_created = true;
		      exit;
		     }
		    }
		    button_variables_info = dks_button_reel_create("down",s,128,64,128,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
		    for (var i =0; i<s; i++)
		    {
		     dks_button_add_text(button_variables_info, i, "variable "+ string(i));
		    }
		    button_variables_int  =  dks_button_reel_create("down",s,256,64,64,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
		    input_list = dks_input_list_create(button_variables_int, target.variables,1);
		    input_created = true;
		   }
		   else
		   {
		    dks_input_list_destroy(input_list);
			   input_created = 0;
		    button_variables_info = 0;
		    button_variables_int  = 0;
		    target.variables[0] = 0;
		    var s = array_length(target.variables);
		    var info = target.object_transform;
		    if(info !=noone)
		    {
		     if ds_map_exists(obj_editor_control.var_map, info)
		     {
		      var l = obj_editor_control.var_map[? info];
		      var size = ds_list_size(l);
		      button_variables_info = dks_button_reel_create("down",size,128,64,128,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
		      for (var i =0; i<size; i++)
		      {
		       dks_button_add_text(button_variables_info, i, l[| i]);
		      }
        
								button_variables_int  =  dks_button_reel_create("down",s,256,64,256,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
		      input_list = dks_input_list_create(button_variables_int, target.variables,1);
		      input_created = true;
		      exit;
		     }
		    }
		    button_variables_info = dks_button_reel_create("down",s,128,64,128,24,64,12,0,dark_gray,orange_pastel,orange_pastel,dark_gray,spr_button_128x24);
		    for (var i =0; i<s; i++)
		    {
		     dks_button_add_text(button_variables_info, i, "variable "+ string(i));
		    }
		    button_variables_int  =  dks_button_reel_create("down",1,256,64,64,24,10,2,0,dark_gray,dark_gray,orange_pastel,dark_gray,spr_button_256);
		    input_list = dks_input_list_create(button_variables_int, target.variables,1);
		    input_created = true;
		   }
		   break;
		   case 1: 
		   dks_input_list_destroy(input_list);
		   input_created = 0;
		   button_variables_info = 0;
		   button_variables_int  = 0;
		   target.variables = 0;
     break;
		   case 2:
		   if(target.object_transform !=noone)
		   {
		    var ob = asset_get_index(target.object_transform);
		    //scr_copy_object(target);
		    with(target)
		    {
		     var new_ob = dks_object_swap(x,y, ob);
		     obj_deco_creator.target = new_ob;
       with(new_ob)
		     {
		      if (perform_event != -1)
		      {
		       event_user(perform_event);
		      }
		     }
		    }
		    //menu_setters = setter.closed;
		   }
		   else
		   {
		    with(target)
		    {
		     var new_ob = dks_object_swap(x,y, obj_deco);
		     obj_deco_creator.target = new_ob;
		    } 
		   }
		   break;
		  }
		 }
		}
	}
	else
	{
	 if mouse_check_button_pressed(mb_left)
	 {
	  var press = dks_button_press(button_variables_create);
	  if (press !=-1)
	  {
	   dks_message("You must to select an object");
	  }
	 }
	}
}