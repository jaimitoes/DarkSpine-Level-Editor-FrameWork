/// @description GUI elements
if(show_interface)
{
 draw_set_halign(fa_center);
 draw_set_valign(fa_middle);
 //Drawing the current mode: this state machine draw the main buttons Reel stored in the create event of this object.
 script_execute(mode_draw[modo]);
 //Draw the current setter tool
 if (menu_setters != setter.closed)
 {
  // This button close any active setter
  draw_sprite(spr_icon_back,0,menu_b_close[0][0],menu_b_close[0][1]);
  // This state machine draw the secondary setter panel
  script_execute(script_draw[menu_setters]);
 }
 //reset gpu color
 draw_set_colour(c_white);
} 

