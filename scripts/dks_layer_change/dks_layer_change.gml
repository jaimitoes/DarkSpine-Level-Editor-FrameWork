function dks_layer_change() 
{
	globalvar laykey;
	globalvar laytext;
	laykey  = last_input;
	laytext  = text_input;
	if(instance_exists(obj_deco))
	{  
	 with(obj_deco)
	 {
	  if(lay_depth = other.layer_index[laykey][1])
	  {
	   layer_offset = zoff - lay_depth;
	   lay_depth = real(laytext);
	   depth = lay_depth + layer_offset;
	  }
	 }
	}  
	layer_index[last_input][@1] = dks_variable_get_text_real(text_input);
	lay_depth = layer_index[last_input][1];
	depth = lay_depth;
	dks_button_add_text(button_layer_depth,last_input,lay_depth);
	dks_cam_update_z(obj_cam_editor, camera_get_view_x(Cam), camera_get_view_y(Cam), lay_depth);
	dks_message("LAYER DEPTH ARE CHANGED TO : "+string(lay_depth));
}