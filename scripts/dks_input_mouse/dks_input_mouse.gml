/// @description dks_input_mouse(x, y)
/// @param x
/// @param  y
function dks_input_mouse(argument0, argument1) 
{
	var inbox, inmnu, mx, my;
	mx = argument0;
	my = argument1;
	inbox = point_in_rectangle(mx, my, x, y, x+width, y+height);
	inmnu = (dks_input_hover() && menu_select);
	if (cursor_pos2 != cursor_pos)
	{
	 if (cursor_hand)
	 {       
	  var x1, y1, x2;
	  x1 = x+xoffset;
	  y1 = y+yoffset;
	  x2 = (x+width)-xoffset;
	  var cx1, cx2, curx1, curx2;
	  cx1 = clamp(x1+string_width(string_copy(text, 0, cursor_pos))-scroll, x1, x2);
	  cx2 = clamp(x1+string_width(string_copy(text, 0, cursor_pos2))-scroll, x1, x2);
	  curx1 = min(cx1, cx2);
	  curx2 = max(cx1, cx2);
	  var txh, txty;
	  txh = string_height("Wp");
	  txty = height-yoffset-(txh/2);
	  cy1 = round((y1+txty)-(cursor_offset*cursor_hand));
	  cy2 = round((y1+txty+txh)+(cursor_offset*cursor_hand));
  
	  cursor_hover[0] = point_distance(mx, my, curx1, cy1) < cursor_radius;
	  cursor_hover[1] = point_distance(mx, my, curx2, cy2) < cursor_radius; 
	 }
	}

	if (inbox || inmnu)
	{
	 if (inbox)
	 {
	  if (mouse_check_button_pressed(mb_left))
	  {
  
	   if (!active)
	   {
	    active = 1;
	    keyboard_lastkey = -1;
	    keyboard_lastchar = "";
	   }
 
	   hold_timer = hold_delay;
	   hold_x = mx;
	   if (cursor_hover)
	   {
	    cursor_hand_drag = 1;
	   }
	   else
	   {
	    cursor_drag = 1;
	    cursor_pos = dks_string_find_x(text, x+xoffset, mx+scroll, 0);
	    cursor_pos2 = cursor_pos;
	    menu_select = 0;
	    cursor_anim = 1;
	    if (dclick_timer = -1)
	    {                
	     dclick_timer = dclick_delay;
	     dclick_x = mx;
	    }
	    else
	    {
	     var pos;
	     pos = dks_string_find_w_end(text, cursor_pos)
	     cursor_pos = pos[0];
	     cursor_pos2 = pos[1];
	     cursor_drag = 0;
	     if (menu_enabled) menu_select = 1;
	     dclick_timer = -1;
	    }
	   }
	  }
	 }
	}
	else
	{
	 if (mouse_check_button_pressed(mb_left))
	 {
	  active = 0;
	  menu_select = 0;
	 }
	}

	if (mouse_check_button(mb_left))
	{
	 if (mx = hold_x)
	 {
	  if (hold_timer = 0)
	  {
  
	   if (menu_enabled) 
	   {
	    menu_select = 1;
	   } 
  
	   hold_timer = -1;
	  }
	 }
	 else hold_timer = -1;
	}
	else hold_timer = -1;
    
    

	if (cursor_drag && mouse_check_button(mb_left))
	{
	 cursor_pos2 = dks_string_find_x(text, x+xoffset, mx+scroll, 0);
	 if (!cursor_drag) cursor_pos = cursor_pos2;
	}
	else 
	{
	 cursor_drag = 0;
	} 

	if (cursor_hand_drag)
	{
	 var px, pt;
	 px = (cursor_pos<cursor_pos2);
	 pt = dks_string_find_x(text, x+xoffset, mx+scroll, 0);
	 if (cursor_hand_drag)
	 {
	  if (px = 1) 
	  {
	   cursor_pos = min(pt, cursor_pos2-1);
	  }
	  else
	  {
	   cursor_pos2 = min(pt, cursor_pos-1);
	  }
	 }
 
 
	 if (!mouse_check_button(mb_left)) 
	 {
	  cursor_hand_drag = 0;
	 }
	}
	if (dclick_timer > -1) dclick_timer -= 1;
	if (dclick_x != mx) dclick_timer = -1;
	if (hold_timer > -1) hold_timer -= 1;
	if (!active)
	{
	 cursor_pos = 0;
	 cursor_pos2 = 0;
	}
}