/// @description ////////////////////////////////////////////////////////
function dks_menu_layer_init() 
{
	//LAYERS
	layer_reorder = -1;
	button_layer_add = dks_button_create(130,0,128,32,64,16,dark_gray,lime_pastel,lime_pastel,dark_gray,spr_button);
	dks_button_add_text(button_layer_add, 0, "ADD LAYER");


	layer_index[0][0] = "Origin of the world";
	layer_index[0][1] = 0; //depth layer
	layer_index[0][2] = 1; // visible layer
	layer_index[0][3] = 0; // locked layer
	button_layer_select = dks_button_create(130,64,256,24,128,14,dark_gray,node_color,node_color,dark_gray,spr_button_256);
	dks_button_add_text(button_layer_select,0,layer_index[0][0]);
	button_layer_depth = dks_button_create(130+256,64,128,24,64,12,dark_gray,node_color,node_color,dark_gray,spr_button_128x24);
	dks_button_add_text(button_layer_depth,0,layer_index[0][1]);
	button_layer_view = dks_button_create(130+256+128,64,32,24,16,12,dark_gray,node_color,node_color,dark_gray,spr_button_24);
	button_layer_lock = dks_button_create(130+256+128+32,64,32,24,16,12,dark_gray,node_color,node_color,dark_gray,spr_button_24);
	button_layer_delete = dks_button_create(130+256+128+64,64,32,24,16,12,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	dks_button_add_text(button_layer_delete,0,"X");
	text_question[question.LayerInput][0] = "Insert the new (real) value for this layer :";
	text_question[question.LayerInput][1] = dks_layer_change;
	text_question[question.LayerAdd][0] = "Insert the name (string)  for the new layer :";
	text_question[question.LayerAdd][1] = dks_layer_add;
	text_question[question.LayerDel][0] = "would you like to delete this layer?";
	text_question[question.LayerDel][1] = dks_layer_delete;
	//////////////////////////////////////////////////////
	///layers variables
	lay_depth = 0;
	depth = lay_depth;
}