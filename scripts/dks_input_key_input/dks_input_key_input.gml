/// @description dks_input_key_input
function dks_input_key_input()
{
 if (active)
	{       
	 var in;
	 in = (cursor_pos != cursor_pos2);
	 if ((keyboard_lastkey != -1) && (keyboard_lastkey != ord("#")))
	 {            
	  var kcheck;
	  kcheck = keyboard_check(vk_shift)-keyboard_check(vk_control);
	  if ((!keyboard_check(vk_shift)) && (!keyboard_check(vk_control))) 
	  {
	   kcheck = -2;
	  } 
   switch (keyboard_lastkey)
	  {
	   ////////////////////////////////////////
	   case vk_home:
	   cursor_pos = 0;
	   cursor_pos2 = cursor_pos;
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   break;
	   ////////////////////////////////////////
	   case vk_end:
	   cursor_pos = string_length(text);
	   cursor_pos2 = cursor_pos;
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   break;
	   ///////////////////////////////////////
	   case vk_left:
	   if (in && (kcheck = -2))
	   {
	    var minpos;
	    minpos = min(cursor_pos, cursor_pos2);
	    cursor_pos = minpos;
	    cursor_pos2 = minpos;
	   }
	   else
	   {
	    var newpos;
	    if (kcheck = -1)
	    {
	     var pos = dks_string_find_w_end(text, cursor_pos);
	     newpos = pos[0];
	    }
	    else 
	    {
	     newpos = clamp(cursor_pos2-1, 0, string_length(text));
	    } 
	    cursor_pos2 = newpos;
	    if (kcheck != 1)
	    {
	     cursor_pos = cursor_pos2;
	    }  
	   }
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   break;
	   /////////////////////////////////////////////
	   case vk_right:
	   if (in && (kcheck = -2))
	   {
	    var maxpos;
	    maxpos = max(cursor_pos, cursor_pos2);
	    cursor_pos = maxpos;
	    cursor_pos2 = maxpos;
	   }
	   else
	   {
	    var newpos;
	    if (kcheck = -1)
	    {
	     var pos;
	     pos = dks_string_find_w_end(text, cursor_pos+1); 
	     newpos = pos[1];
	    }
	    else 
	    {
	     newpos = clamp(cursor_pos2+1, 0, string_length(text));
	    } 
	    cursor_pos2 = newpos;
	    if (kcheck != 1) 
	    {
	     cursor_pos = cursor_pos2;
	    } 
	   }
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   break;
	   //////////////////////////
	   case vk_backspace:
	   if (in)
	   {
	    dks_input_delete_selected(id);
	   }
	   else
	   {
	    if (kcheck = -1)
	    {
	     var pos = dks_string_find_w_end(text, cursor_pos2);
	     text = string_delete(text, pos[0], cursor_pos2-pos[0]);
	     cursor_pos = pos[0];
	     cursor_pos2 = cursor_pos;
	    }
	    else
	    {
	     text = string_delete(text, cursor_pos, 1);
	     cursor_pos -= 1;
	     cursor_pos2 = cursor_pos;
	    }
	   }
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   ds_stack_push(history0, text);
	   ds_stack_clear(history1);
	   break;
	   /////////////////////
	   case vk_delete:
	   if (in)
	   {
	    dks_input_delete_selected(id);
	   }
	   else
	   {
	    if (kcheck = -1)
	    {
	     var pos= dks_string_find_w_end(text, cursor_pos2);
	     text = string_delete(text, cursor_pos2, pos[1]-cursor_pos2);
	     cursor_pos = pos[1];
	     cursor_pos2 = cursor_pos;
	    }
	    else
	    {
	     text = string_delete(text, cursor_pos+1, 1);
	    }
	   }
	   ds_stack_push(history0, text);
	   ds_stack_clear(history1);
	   cursor_time = cursor_anim_speed;
	   cursor_anim = 1;
	   chk = 1;
	   break;
	   //////////////////////////////////////////
	   case vk_enter:
	   if (in)
	   {
	    dks_input_delete_selected(id);
	   }
	   break;
	   //////////////////////////////////////////
	   default:
	   var chk = 0;
	   if (keyboard_lastkey = ord("A"))
	   {
	    if (kcheck = -1)
	    {
	     cursor_pos = 0;
	     cursor_pos2 = string_length(text);
	     in = 1;
	     ds_stack_push(history0, text);
	     ds_stack_clear(history1);
	     chk = 1;
	    }
	   } 
	   if (keyboard_lastkey = ord("C"))
	   {
	    if (kcheck = -1)
	    {
	     if (in)
	     {
	      var t, minpos, maxpos;
	      minpos = min(cursor_pos, cursor_pos2);
	      maxpos = max(cursor_pos, cursor_pos2);
	      t = string_copy(text, minpos+1, maxpos-minpos);
	      clipboard_set_text(t);
	      cursor_time = cursor_anim_speed;
	      cursor_anim = 1;
	      chk = 1;
	     }
	    }
	   }
	   if (keyboard_lastkey = ord("V"))
	   {
	    if (kcheck = -1)
	    {
	     if (clipboard_has_text())
	     {
	      if (in)
	      {
	       dks_input_delete_selected(id);
	      }
	      var clptxt;
	      clptxt = clipboard_get_text()
	      text = string_insert(clptxt, text, cursor_pos+1);
	      cursor_pos += string_length(clptxt);
	      cursor_pos2 = cursor_pos;
	      ds_stack_push(history0, text);
	      ds_stack_clear(history1);
	      cursor_time = cursor_anim_speed;
	      cursor_anim = 1;
	      chk = 1;
	     }
	    }
	   }
                    
	   if (keyboard_lastkey = ord("X"))
	   {
	    if (kcheck = -1)
	    {
	     if (in)
	     {
	      var t, minpos, maxpos;
	      minpos = min(cursor_pos, cursor_pos2);
	      maxpos = max(cursor_pos, cursor_pos2);
	      t = string_copy(text, minpos+1, maxpos-minpos);
	      clipboard_set_text(t);
	      dks_input_delete_selected(id);
	      ds_stack_push(history0, text);
	      ds_stack_clear(history1);
	      cursor_time = cursor_anim_speed;
	      cursor_anim = 1;
	      chk = 1;
	     }
	    }
	   }
   
	   if (keyboard_lastkey = ord("Z"))
	   {
	    if (kcheck = -1)
	    {
	     if (ds_stack_size(history0) > 1)
	     {
	      var t1, t2;
	      t1 = ds_stack_top(history0);
	      ds_stack_push(history1, t1)
	      ds_stack_pop(history0);
	      t2 = ds_stack_top(history0);
	      text = t2;
	      cursor_time = cursor_anim_speed;
	      cursor_anim = 1;
	      chk = 1;
	     }
	    }
	   }
   
	   if (keyboard_lastkey = ord("Y"))
	   {
	    if (kcheck = -1)
	    {
	     if (ds_stack_size(history1) > 1)
	     {
	      var t;
	      t = ds_stack_pop(history1);
	      ds_stack_push(history0, t)
	      text = t;
	      chk = 1;
	      }
	     }
	    }
    
	    if (chk != 1)
	    {
	     if (string_length(keyboard_lastchar) != 0)
	     {
	      if (in)
	      {
	       dks_input_delete_selected(id);
	      }
	      text = string_insert(keyboard_lastchar, text, cursor_pos+1);
	      cursor_pos += 1;
	      cursor_pos2 = cursor_pos;
	      ds_stack_push(history0, text);
	      ds_stack_clear(history1);
	      cursor_time = cursor_anim_speed;
	      cursor_anim = 1;
	     }
	    }
	    break;
	   }
	   keyboard_lastkey = -1;
	   keyboard_lastchar = "";
	  }
	 }
}