function dks_gui_terrain_set_splits() 
{
	with(target)
	{
	 if(other.last_input = 1)
	 {
	  terrain_split += 1;
	  if (terrain_split >8)
	  {
	   terrain_split = 1;
	  }
	 }
	 else
	 {
	  v_split += 1;
	  if (v_split >8)
	  {
	   v_split = 1;
	  }
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
	dks_input_set_text(input_list[| 1],string(target.terrain_split));
	dks_input_set_text(input_list[| 2],string(target.v_split));
}