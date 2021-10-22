
var in;
in = (cursor_pos != cursor_pos2);
draw_set_font(font);
var x1, y1, x2;
x1 = x+xoffset;
y1 = y+yoffset;
x2 = (x+width)-xoffset;

surface_set_target(surf);
draw_clear_alpha(font_color, 0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(font_color);
draw_set_alpha(font_alpha);
var tx, ty;
tx = string_height("Wp");
ty = ((height-(yoffset*2))/2)-(tx/2);
draw_text(-scroll, ty, text);
if (active)
{
 if (in)
 {
  
  draw_set_colour(cursor_col);
  draw_set_alpha(cursor_al);
  var cx1, cx2, minpos, maxpos;
  minpos = min(cursor_pos, cursor_pos2);
  maxpos = max(cursor_pos, cursor_pos2);
  cx1 = string_width(string_copy(text, 0, minpos))-scroll;
  cx2 = string_width(string_copy(text, 0, maxpos))-scroll;
  draw_rectangle(cx1, ty, cx2, ty+tx, 0);
  draw_set_colour(cursor_text_col);
  draw_set_alpha(cursor_text_al);
  var st, stx;
  st = string_copy(text, minpos+1, (maxpos-minpos));
  stx = cx1;
  draw_text(stx, ty, st);
 }
}    

surface_reset_target();
draw_surface(surf, x1, y1);
if (draw_cursor)
{ 
 var tilt;
 if (in)
 {
  if (cursor_hand) 
  {
   tilt = 1; 
  }
  else 
  {
   tilt = 0;
  } 
 }
 else 
 {
  tilt = cursor_anim;
 } 
 
 if (!active) 
 {
  tilt = 0;
 } 
 var cx1, cx2, cx1, cx2;
 cx1 = clamp(x1+string_width(string_copy(text, 0, cursor_pos))-scroll, x1, x2);
 cx2 = clamp(x1+string_width(string_copy(text, 0, cursor_pos2))-scroll, x1, x2);
 cx1 = min(cx1, cx2);
 cx2 = max(cx1, cx2);
 if (tilt)
 {
  draw_set_colour(cursor_col);
  draw_set_alpha(cursor_al);
  var cy1, cy2;
  cy1 = round((y1+ty)-(cursor_offset*cursor_hand));
  cy2 = round(y1+ty+tx);
  draw_line_width(cx1, cy1, cx1, cy2, cursor_wid);
  if (in && cursor_hand) 
  {
   draw_sprite_ext(arrow_sprite, 0, round(cx1), cy1, 1, 1, 0, cursor_col, cursor_al);
  } 
  if (in)
  {
   cy1 = round(y1+ty);
   cy2 = round((y1+ty+tx)+(cursor_offset*cursor_hand));
   draw_line_width(cx2, cy1, cx2, cy2, cursor_wid);
   if (cursor_hand) 
   {
    draw_sprite_ext(arrow_sprite, 0, round(cx2), cy2, 1, 1, 0, cursor_col, cursor_al);
   } 
  }
 }
} 
  
    
draw_set_alpha(1);
draw_set_colour(c_white);

