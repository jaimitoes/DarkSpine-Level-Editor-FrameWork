/// @description dks_menu_draw_layer
function dks_menu_draw_layer() 
{
	dks_draw_button_reel(button_layer_add);
	dks_draw_button_reel(button_layer_select);
	dks_draw_button_reel(button_layer_depth);
	dks_draw_button_sprite(button_layer_view);
	dks_draw_button_sprite(button_layer_lock);
	dks_draw_button_reel(button_layer_delete);
	var s = array_length(layer_index);
	for (var i =0; i<s;i++)
	{
	 if (layer_index[i][2])
	 {
	  draw_sprite(spr_icon_eye,0,button_layer_view[i][0],button_layer_view[i][1]);
	 }
     
	 if (lay_depth = layer_index[i][1])
	 {
	  draw_sprite_ext(spr_button_active,0,button_layer_select[i][0],button_layer_select[i][1],1,1,0,c_lime,1);
	 }
	 else
	 {
	  draw_sprite_ext(spr_button_active,0,button_layer_select[i][0],button_layer_select[i][1],1,1,0,c_red,1);
	 }
	 if (layer_index[i][3])
	 {
	  draw_sprite(spr_canda,0,button_layer_lock[i][0],button_layer_lock[i][1]);
	 }    
	 else
	 {
	  draw_sprite(spr_canda,1,button_layer_lock[i][0],button_layer_lock[i][1]);
	 }
	}
}