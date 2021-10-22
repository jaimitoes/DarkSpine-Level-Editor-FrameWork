/// Draw the Tween Panel
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite_stretched_ext(spr_button_question,0,-32,176,368,568,dark_gray,1);
draw_sprite_stretched_ext(spr_button_question,1,-32,176,368,568,orange_pastel,1);
// Drawing the Player keys
for(var i=0;i<8;i++)
{
 if (k_play[i])=1
 {
  draw_sprite_ext(spr_key_player,i,key_player[i][0],key_player[i][1],1,1,0,c_lime,1);
 }
 else
 {
  draw_sprite(spr_key_player,i,key_player[i][0],key_player[i][1]);
 }
}
// Key get motion and set motion
dks_draw_button_reel(key_get);
// Key minus and plus
dks_draw_button_reel(key_minus);
dks_draw_button_reel(key_plus);
// Drawing the Destroy slots buttons
dks_draw_button_reel(key_dest);
// Drawing the activator slots buttons
dks_draw_button_reel(key_set);
// Drawing the Key properties buttons
dks_draw_button_reel(key_type);
// Drawing the analogue bars buttons
dks_draw_button_reel(bar);

if (node_target!= noone) and (node_target.object_index = obj_tween_node)
{
 dks_draw_button_reel(button_sequence_info);
 dks_draw_button_reel(button_argument_add);
 dks_draw_button_reel(button_argument_del);
 dks_draw_button_reel(button_column_copy);
 dks_draw_button_reel(button_column_paste);
 if(show_arguments)
 {
  if is_array(button_callStart_info)
  {
   dks_draw_button_reel(button_callStart_info);	 
  }
  if is_array(button_callEnd_info)
  {
   dks_draw_button_reel(button_callEnd_info);	 	 
  }
  if is_array(button_callStop_info)
  {
   dks_draw_button_reel(button_callStop_info);	  
  }
 }
} 



