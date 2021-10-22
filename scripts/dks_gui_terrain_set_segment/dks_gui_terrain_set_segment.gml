/// @description dks_gui_terrain_set_segment
function dks_gui_terrain_set_segment() 
{
	with(target)
	{
	 segment_split += 1;
	 if (segment_split >4)
	 {
	  segment_split = 1;
	 }
	 dks_vertex_check(id);
	}
	dks_input_set_text(input_list[| 5],string(target.segment_split));
}