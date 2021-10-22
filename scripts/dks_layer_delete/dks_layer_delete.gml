function dks_layer_delete() 
{
	var s = array_length(layer_index);
	if (s >1)
	{
	 globalvar laykey;
	 globalvar laytext;
	 laykey  = last_input;
	 obj_deco_creator.target = noone;
	 if(instance_exists(obj_deco))
	 {  
	  with(obj_deco)
	  {
	   if(lay_depth = other.layer_index[laykey][1])
	   {
	    instance_destroy();
	   }
	  }
	 }  
	 layer_index[laykey][1] = "null";
	 button_layer_select = 0;
	 button_layer_depth = 0; 
	 button_layer_view = 0;
	 button_layer_lock = 0;
	 button_layer_delete = 0;
	 s = array_length(layer_index);
	 var temp_name = ds_list_create();
	 var temp_depth = ds_list_create();
	 var temp_view = ds_list_create();
	 var temp_lock = ds_list_create();
	 for(var i =0; i<s;i++)
	 {
	  if(layer_index[i][1] != "null")
	  {
	   ds_list_add(temp_name, layer_index[i][0]);
	   ds_list_add(temp_depth, layer_index[i][1]);
	   ds_list_add(temp_view, layer_index[i][2]);
	   ds_list_add(temp_lock, layer_index[i][3]);
	  }
	 }

	 layer_index = 0;
	 var l_color = 0;
	 if(modo = mode.create)
	 {
	  l_color = node_color;
	 }
	 else
	 {
	  l_color = orange_pastel;
	 }
	 s = ds_list_size(temp_name)
	 button_layer_select = dks_button_reel_create("down",s,130,64,256,24,128,14, 2,dark_gray,l_color,l_color,dark_gray,spr_button_256);
	 button_layer_depth = dks_button_reel_create("down",s,130+256,64,128,24,64,12, 2,dark_gray,l_color,l_color,dark_gray,spr_button_128x24);
	 button_layer_view = dks_button_reel_create("down",s,130+256+128,64,32,24,12,12, 2,dark_gray,l_color,l_color,dark_gray,spr_button_24);
	 button_layer_lock = dks_button_reel_create("down",s,130+256+128+32,64,32,24,12,12, 2,dark_gray,l_color,l_color,dark_gray,spr_button_24);
	 button_layer_delete = dks_button_reel_create("down",s,130+256+128+64,64,32,24,16,12, 2,dark_gray,red_pastel,red_pastel,dark_gray,spr_button_24);
	 for(var i =0; i<s;i++)
	 {
	  layer_index[i][0] = temp_name[| i]; 
	  layer_index[i][1] = temp_depth[| i]; 
	  layer_index[i][2] = temp_view[| i]; 
	  layer_index[i][3] = temp_lock[| i]; 
	  dks_button_add_text(button_layer_select, i, layer_index[i][0]);
	  dks_button_add_text(button_layer_depth, i, layer_index[i][1]);
	  dks_button_add_text(button_layer_delete, i, "x");
	 }
	 ds_list_destroy(temp_name);
	 ds_list_destroy(temp_depth);
	 ds_list_destroy(temp_view);
	 ds_list_destroy(temp_lock);
	}
	else
	{
	 dks_message("A least of 1 layer must be present");
	}
}