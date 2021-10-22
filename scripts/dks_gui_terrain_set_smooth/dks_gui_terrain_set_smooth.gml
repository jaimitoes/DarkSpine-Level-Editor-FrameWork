function dks_gui_terrain_set_smooth() 
{
	with(target)
	{
	 if (smooth_terrain)
	 {
	  smooth_terrain =0;
	  dks_message("Smooth terrain disabled");
	 }
	 else
	 {
	  dks_message("Smooth terrain enabled");
	  smooth_terrain = 1;
	 }
	 if(have_path_texture)
	 {
	  dks_vertex_terrain_create();
	 }
	 if(have_texture)
	 {
	  dks_vertex_shape_create();
	 }
	}
	if (target.smooth_terrain)
	{
	 dks_input_set_text(input_list[| 0],"Enabled");
	}
	else
	{
	 dks_input_set_text(input_list[| 0],"Disabled");
	}
}