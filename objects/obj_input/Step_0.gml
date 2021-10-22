draw_set_font(font);
if (!surface_exists(surf))
{
 surf = surface_create(width-(xoffset*2), height-(yoffset*2));
}

dks_input_mouse(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0));
cursor_time -= 1;
if (cursor_time = 0)
{
 cursor_anim = !cursor_anim;
 cursor_time = cursor_anim_speed;
}
dks_input_key_input();
var tw, bw;
tw = string_width(text);
bw = (width-(xoffset*2));
if (tw > bw)
{
 scroll_max = tw-bw;
}
else
{
 scroll_max = 0;
 scroll = 0;
}
    
if (scroll_max != 0)
{
 var curx
 curx = (x+xoffset)+string_width(string_copy(text, 0, cursor_pos2))-scroll;
 var x1, x2;
 x1 = x+xoffset;
 x2 = (x+width)-xoffset;
 if (curx < x1) scroll -= x1-curx;
 if (curx > x2) scroll += curx-x2;
 scroll = clamp(scroll, 0, scroll_max)
}
var in;
in = (cursor_pos != cursor_pos2);
if (menu_select)
{
 if (string_length(text) = 0) 
 {
  menu_select = 0;
 } 
 dks_input_menu_update();
 dks_input_menu_resize();
 var x1, y1, x2;
 x1 = x+xoffset;
 y1 = y+yoffset;
 x2 = (x+width)-xoffset;
 draw_set_font(font)
 var cx1, cx2, curx1, curx2;
 cx1 = clamp(x1+string_width(string_copy(text, 0, cursor_pos))-scroll, x1, x2);
 cx2 = clamp(x1+string_width(string_copy(text, 0, cursor_pos2))-scroll, x1, x2);
 curx1 = min(cx1, cx2);
 curx2 = max(cx1, cx2);
 var y1, mt, tx, ty;
 y1 = y+yoffset;
 mt = round(curx1+((curx2-curx1)/2));
 tx = mt+menu_x;
 ty = y1+menu_y;
 if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), tx, ty, tx+menu_width, ty+menu_height))
 {
  menu_select = -1;
  for (i = 0; i < menu_length; i += 1)
  {
   if (menu_sets[i][4])
   {
    if ((device_mouse_x_to_gui(0) > (tx+menu_sets[i][1]-scratch_pad)) && (device_mouse_x_to_gui(0) < (tx+menu_sets[i][2]+scratch_pad)))
    {
     menu_select = i;
    }
   }
  }
 }
 else 
 {
  menu_select = -1;
 } 
}
else 
{
 menu_select = -1;
} 
    
   
if (menu_select != -1)
{
 if (mouse_check_button_pressed(mb_left))
 {
  switch (menu_select)
  {
   case 0:
   var pos;
   pos = dks_string_find_w_end(text, cursor_pos)
   cursor_pos = pos[0];
   cursor_pos2 = pos[1];
   break;
   case 1:
   cursor_pos = 0;
   cursor_pos2 = string_length(text);
   break;
   case 2:
   if (in)
   {
    dks_input_copy();
    cursor_time = cursor_anim_speed;
    cursor_anim = 1;
   }
   break;
   case 3:
   if (clipboard_has_text())
   {
    if (in)
    {
     dks_input_delete_selected(id);
    }
    dks_input_paste();
    ds_stack_push(history0, text);
    ds_stack_clear(history1);
    cursor_time = cursor_anim_speed;
    cursor_anim = 1;
   }
   break;
   case 4:
   if (in)
   {
    dks_input_copy();
    dks_input_delete_selected(id);
    ds_stack_push(history0, text);
    ds_stack_clear(history1);
    cursor_time = cursor_anim_speed;
    cursor_anim = 1;
    break;
   }
  }
 }
}
    
text = string_replace_all(text, @"
", "");
text = string_replace_all(text, "#", "");
text = string_replace_all(text, chr(13)+chr(10), "");
text = string_replace_all(text, chr(13), "");
text = string_replace_all(text, chr(15), "");
text = string_replace_all(text, chr(10), "");
cursor_pos = clamp(cursor_pos, 0, string_length(text)); 
cursor_pos2 = clamp(cursor_pos2, 0, string_length(text));

if ((ds_stack_size(history0) > 10) || (ds_stack_size(history1) > 10))
{
 ds_stack_clear(history0);
 ds_stack_clear(history1);
 ds_stack_push(history0, text);
}

