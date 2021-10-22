with (obj_deco_creator) 
{ 
 if(draw_data)
 {
  //If a deco object has been run from the editor to become any object in your library,...
  //...his name will be shown in a small panel while you point it with the mouse.
  // Get the half width of the object name
  var stw = string_width(near_name)*0.5;
  var sth = string_height(near_name)*0.5;
  // Set the draw transparency to 0.5
  draw_set_alpha(0.5);
  // Draw a simple rectangle panel usig the text offset from the previous variables.
  draw_rectangle_colour(near_cord[0]-stw,near_cord[1]-sth,near_cord[0]+stw,near_cord[1]+sth, c_black, c_black, c_black, c_black,0);
  // Set the text alignment
  draw_set_alpha(1);
  draw_set_halign(fa_center);
  draw_set_valign(fa_middle);
  // Draw the object name
  draw_text_color(near_cord[0], near_cord[1], near_name, c_color, c_color, c_color, c_color, 1);
 }  
}