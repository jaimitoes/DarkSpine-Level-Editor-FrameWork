function dks_layer_add() 
{
	var s = array_length(layer_index);
	layer_index[s][0] = text_input;
	layer_index[s][1] = layer_index[ s-1][1]+1;
	layer_index[s][2] = 1;
	layer_index[s][3] = 0;
	var color;
	if(modo = mode.edit)
	{
	 color = orange_pastel;
 
	}
	else
	{
	 color = node_color;
	}
	button_layer_select = dks_button_add_reel(button_layer_select,"down",256,24,128,14,2,dark_gray,color,color,dark_gray,spr_button_256);
	dks_button_add_text(button_layer_select,s,layer_index[s][0]);
	button_layer_depth = dks_button_add_reel(button_layer_depth,"down",256,24,64,12,2,dark_gray,color,color,dark_gray,spr_button_128x24);
	dks_button_add_text(button_layer_depth,s,layer_index[s][1]);
	button_layer_view = dks_button_add_reel(button_layer_view,"down",256,24,12,12,2,dark_gray,color,color,dark_gray,spr_button_24);
	button_layer_lock = dks_button_add_reel(button_layer_lock,"down",256,24,12,12,2,dark_gray,color,color,dark_gray,spr_button_24);
	button_layer_delete = dks_button_add_reel(button_layer_delete,"down",256,24,16,12,2,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	dks_button_add_text(button_layer_delete,s,"X");
}