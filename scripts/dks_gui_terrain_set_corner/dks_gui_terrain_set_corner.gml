function dks_gui_terrain_set_corner() 
{
	with(target)
	{
	 if(other.last_input = 3)
	 {
	  corner_left+=1;
	  if(corner_left >8)
	  {
	   corner_left =0;
	  }
	 }
	 else
	 {
	  corner_right +=1;
	  if(corner_right >8)
	  {
	   corner_right =0;
	  }
	 }
	  if(have_path_texture)
	 {
	  dks_vertex_terrain_create();
	 }
	}
	dks_input_set_text(input_list[| 3],string(target.corner_left));
	dks_input_set_text(input_list[| 4],string(target.corner_right));
}