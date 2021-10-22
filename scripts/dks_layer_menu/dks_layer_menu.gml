/// @description dks_layer_menu
function dks_layer_menu() 
{
	button_layer_select = 0;
	button_layer_depth = 0;
	button_layer_view =0;
	button_layer_lock =0;
	button_layer_delete =0;
	var color;
	if(modo = mode.edit)
	{
	 color = orange_pastel;
	}
	else
	{
	 color = node_color;
	}
	button_layer_select = dks_button_create(130,64,256,24,128,14,dark_gray,color,color,dark_gray,spr_button_256);
	dks_button_add_text(button_layer_select,0,layer_index[0][0]);
	button_layer_depth = dks_button_create(130+256,64,128,24,64,12,dark_gray,color,color,dark_gray,spr_button_128x24);
	dks_button_add_text(button_layer_depth,0,layer_index[0][1]);
	button_layer_view = dks_button_create(130+256+128,64,32,24,12,12,dark_gray,color,color,dark_gray,spr_button_24);
	button_layer_lock = dks_button_create(130+256+128+32,64,32,24,12,12,dark_gray,color,color,dark_gray,spr_button_24);
	button_layer_delete = dks_button_create(130+256+128+64,64,32,24,16,12,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	var s = array_length(layer_index)
	if(s>1)
	{
	 for (var i =1; i<s;i++)
	 {
	  button_layer_select = dks_button_add_reel(button_layer_select,"down",256,24,128,14,2,dark_gray,color,color,dark_gray,spr_button_256);
	  dks_button_add_text(button_layer_select,i,layer_index[i][0]);
	  button_layer_depth = dks_button_add_reel(button_layer_depth,"down",256,24,64,12,2,dark_gray,color,color,dark_gray,spr_button_128x24);
	  dks_button_add_text(button_layer_depth,i,layer_index[i][1]);
	  button_layer_view = dks_button_add_reel(button_layer_view,"down",256,24,12,12,2,dark_gray,color,color,dark_gray,spr_button_24);
	  button_layer_lock = dks_button_add_reel(button_layer_lock,"down",256,24,12,12,2,dark_gray,color,color,dark_gray,spr_button_24);
	  button_layer_delete = dks_button_add_reel(button_layer_delete,"down",256,24,12,12,2,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	  dks_button_add_text(button_layer_delete, i, "x");
	 }
	}
	menu_setters = setter.layer;
}