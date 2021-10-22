function dks_setter_inspector() 
{
	if(input_created)
	{
	 if(mouse_check_button_pressed(mb_left))
	 {
	  var press = dks_button_press(menu_b_inspector_info);
	  if (press = 11)
	  {
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
	    menu_setters = setter.closed;
	   }
	   else
	   {
	    with(target)
	    {
	     var new_ob = dks_object_swap(x,y, obj_deco);
	     obj_deco_creator.target = new_ob;
	    } 
	   }
	  }
	  press = dks_button_press(menu_b_inspector_int);
	  if (press != -1)
	  {
	   switch(press)
	   {
	    case 11: 
	    var st_wid = string_width(text_question[question.Object_transform][0]+" name");
	    dks_question_input( 390, 64, st_wid, 256, dark_gray,orange_pastel,orange_pastel,dark_gray,text_question[question.Object_transform][0], "name");break;
	    case 12: dks_button_execute(menu_b_inspector_int,12);break;
	    case 13: dks_button_execute(menu_b_inspector_int,13);break;
	    case 14: target.visible = !target.visible;
	    dks_input_set_text(input_list[| 14], target.visible);
	    break;
	    case 15: target.activated = !target.activated;
	    dks_input_set_text(input_list[| 15], target.activated);
	    break;
	    case 16: target.is_visible = !target.is_visible;
	    dks_input_set_text(input_list[| 16], target.is_visible);
	    break;
	    case 18: target.object_execute = !target.object_execute;
	    dks_input_set_text(input_list[| 18], target.object_execute);
	    break;
	   }
	  }
	  press = dks_button_press(menu_b_inspector_info)
	  if (press != -1)
	  {
	   switch (press)
	   {
	    case 13: dks_button_execute(menu_b_inspector_info,13);break;
	   }
	  }
	 }  
 
	 if  keyboard_check_released(vk_anykey)
	 {
	  var act = dks_input_list_get_active(input_list);
	  if (act)
	  {
	   dks_undo_write(undo_map,target,0);
	   var text; 
	   text = dks_input_list_get_array_real(input_list);
	   target.x = text[ 0];
	   target.y = text[ 1];
	   target.layer_offset =  text[ 2] - target.lay_depth;
	   target.depth = target.lay_depth + target.layer_offset;
	   target.x_rotation = text[ 3];
	   target.y_rotation = text[ 4];
	   target.image_angle = text[ 5];
	   target.image_xscale = text[ 6];
	   target.image_yscale = text[ 7];
	   target.z_scale = text[ 8];
	   target.image_alpha = text[ 9];
	   target.image_speed = text[ 10];
	   target.perform_event = text[17];
   
	   var s = array_length(layer_index);
	   for(var i =0; i<s; i++)
	   {
	    if(target.depth = layer_index[i,1])
	    {
	     target.lay_depth = layer_index[i,1];
	     target.layer_offset = 0;
	     break;
	    }
	   }
   
	   with(target)
	   {
	    if(have_polygon)
	    {
	     dks_vertex_check(id);
	    }
	    if(parent)
	    {
	     dks_child_transform();
	     scr_layer_depth_child();
	    }
	    dks_tween_set_offset(id);
	    dks_set_offset(id, global.mouse_xd, global.mouse_yd);
	    dks_particle_setter_update(id);
	   }
	  }
	 }
	}
	else
	{
	 var text;
	 text[ 0] = target.x;
	 text[ 1] = target.y;
	 text[ 2] = target.depth;
	 text[ 3] = target.x_rotation;
	 text[ 4] = target.y_rotation;
	 text[ 5] = target.image_angle;
	 text[ 6] = target.image_xscale;
	 text[ 7] = target.image_yscale;
	 text[ 8] = target.z_scale;
	 text[ 9] = target.image_alpha;
	 text[ 10] = target.image_speed;
	 text[ 11] = target.object_transform;
 
	 switch(target.blend_mode)
	 {
  
	  case bm_normal : text[12] = "Bm normal";break;
	  case bm_subtract : text[12] = "Bm subtract";break;
	  case bm_add : text[12] = "Bm add";break;
	  case bm_max : text[12] = "Bm max";break;
	 }
	 var name = script_get_name(target.draw_method);
	 text[13] = name;
	 text[14] =  target.visible;
	 text[ 15] = target.activated;
	 text[ 16] = target.is_visible;
	 text[ 17] = target.perform_event;
	 text[ 18] = target.object_execute;
	 input_list = dks_input_list_create(menu_b_inspector_int,text,1);
	 input_created = true;
	}
}